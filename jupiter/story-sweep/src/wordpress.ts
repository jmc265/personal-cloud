import { TrelloCard } from './trello';
import { execSync } from "child_process";
import { format } from 'date-fns';

const SQL_PASSWORD = process.env.SQL_PASSWORD;
const DOCKER_APP_DATA = process.env.DOCKER_APP_DATA;
const PRIMARY_STORAGE = process.env.PRIMARY_STORAGE;

function runWpCli(cmd: string) {
    const importMediaCommand = `docker run --rm -v ${DOCKER_APP_DATA}/wordpress/html:/var/www/html -v ${PRIMARY_STORAGE}/media/home:/${PRIMARY_STORAGE}/media/home:ro -v /tmp:/tmp -v /docker:/docker --env=WORDPRESS_DB_HOST=wordpress-db --env=WORDPRESS_DB_USER=wordpress --env=WORDPRESS_DB_PASSWORD=${SQL_PASSWORD} --env=WORDPRESS_DB_NAME=wordpress --network=wordpress_default wordpress:cli ${cmd}`;
    const cmdResponse = execSync(importMediaCommand);
    const cmdResponseString = cmdResponse?.toString() ?? '';
    return cmdResponseString;
}

function uploadImageToMediaLibrary(mediaPath: string) {
    if (!mediaPath) {
        return;
    }
    console.log(`Importing ${mediaPath}`);
    try {
        const cmdResponseString = runWpCli(`media import '${mediaPath}'`);
        const id = /as attachment ID (\d*)/.exec(cmdResponseString)?.[1];
        if (id) {
            console.log(`Successfully imported ${mediaPath}`);
            return id;
        } else {
            throw new Error(`Docker exec response doesn't notify of success \n ${cmdResponseString}`);
        }
    } catch (e) {
        console.error(`Error importing file from ${mediaPath}`, e);
    }
}

function createPost(title: string, date: Date, postContent: string) {
    const params = {
        post_author: 1,
        post_date: format(date, 'yyyy-MM-dd HH:mm:ss'),
        post_content: postContent,
        post_title: title,
        post_status: 'publish',
        post_type: 'post',
        comment_status: 'closed',
    }
    const cmdParams = Object.entries(params).map((param) => `--${param[0]}='${param[1]}'`).join(" ");
    const cmdResponseString = runWpCli(`post create ${cmdParams}`);
    const id = /Created post (\d*)/.exec(cmdResponseString)?.[1];
    return id;
}

function addPostToCategory(postId: string, category: string) {
    runWpCli(`post update ${postId} --post_category=${category}`);
}

function createParagraph(text: string) {
    return `<!-- wp:paragraph --><p>${text}</p><!-- /wp:paragraph -->`;
}

function createHeading(text: string) {
    return `<!-- wp:heading --><h2 class="wp-block-heading">${text}</h2><!-- /wp:heading -->`
}

function createImage(id: string, path: string) {
    return `<!-- wp:image {"id":${id},"sizeSlug":"large","linkDestination":"none","lightbox":{"enabled":true}} --><figure class="wp-block-image size-large"><img src="${path}" alt="" class="wp-image-${id}"/></figure><!-- /wp:image -->`;
}
function createVideo(id: string, path: string) {
    return `<!-- wp:video {"id":${id}} --><figure class="wp-block-video"><video controls src="${path}"></video></figure><!-- /wp:video -->`;
}

function createGallery(galleryContents: string) {
    return `<!-- wp:gallery {"linkTo":"none","className":"is-style-masonry"} --><figure class="wp-block-gallery has-nested-images columns-default is-cropped is-style-masonry">${galleryContents}</figure><!-- /wp:gallery -->`;
}

function trelloCardToHTML(card: TrelloCard): string {
    if (card.attachments?.length > 0) {
        const imageId = uploadImageToMediaLibrary(card.attachments[0].filePath);
        const imagePath = runWpCli(`post get ${imageId} --field=guid`);

        return `
        <!-- wp:media-text {"mediaId":${imageId},"mediaLink":"http://jupiter:6543/?attachment_id=${imageId}","mediaType":"image"} -->
        <div class="wp-block-media-text is-stacked-on-mobile">
            <figure class="wp-block-media-text__media"><img src="${imagePath}" class="wp-image-${imageId} size-full"/></figure>
            <div class="wp-block-media-text__content">
                ${createHeading(card.name)}
                ${createParagraph(card.desc)}
            </div>
        </div>
        <!-- /wp:media-text -->`;
    } else {
        return `
        <!-- wp:group {"layout":{"type":"constrained"}} -->
        <div class="wp-block-group">
            ${createHeading(card.name)}
            ${createParagraph(card.desc)}
        </div>
        <!-- /wp:group -->`;
    }
}

function createMediaGallery(localMediaPath: string[]): string {  
    const uploadedMedia = localMediaPath
        .map((localMediaPath) => uploadImageToMediaLibrary(localMediaPath))
        .filter(Boolean)
        .map((mediaId) => ({id: mediaId as string, path: runWpCli(`post get ${mediaId} --field=guid`)}))
        .map((k) => {
            if (k.path.includes('mp4')) {
                return createVideo(k.id, k.path);
            } else {
                return createImage(k.id, k.path);
            }
        });

    return createGallery(uploadedMedia.join(''));
}

export async function createPageForMonth(date: Date, mediaPaths: string[], cards: TrelloCard[]) {
    const postContent = `${cards.map((card) => trelloCardToHTML(card)).join('')} ${createMediaGallery(mediaPaths)}`;
    const postId = createPost(format(date, 'MMMM, y'), date, postContent);
    if (postId) {
        addPostToCategory(postId, 'Monthly');
    }
}
