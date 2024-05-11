const { execSync } = require("child_process");
const { format } = require('date-fns');

const SQL_PASSWORD = process.env.SQL_PASSWORD;
const DOCKER_APP_DATA = process.env.DOCKER_APP_DATA;
const PRIMARY_STORAGE = process.env.PRIMARY_STORAGE;

function runWpCli(cmd) {
    const importMediaCommand = `docker run --rm -v ${DOCKER_APP_DATA}/wordpress/html:/var/www/html -v ${PRIMARY_STORAGE}/media/home:/${PRIMARY_STORAGE}/media/home:ro --env=WORDPRESS_DB_HOST=wordpress-db --env=WORDPRESS_DB_USER=wordpress --env=WORDPRESS_DB_PASSWORD=${SQL_PASSWORD} --env=WORDPRESS_DB_NAME=wordpress --network=wordpress_default wordpress:cli ${cmd}`;
    const cmdResponse = execSync(importMediaCommand);
    const cmdResponseString = cmdResponse?.toString() ?? '';
    return cmdResponseString;
}

function uploadImageToMediaLibrary(mediaPath) {
    if (!mediaPath) {
        return;
    }
    console.log(`Importing ${mediaPath}`);
    try {
        const cmdResponseString = runWpCli(`media import '${mediaPath}'`);
        const id = /as attachment ID (\d*)/.exec(cmdResponseString)[1];
        if (id) {
            console.log(`    Successfully imported`);
            return id;
        } else {
            throw new Error(`Docker exec response doesn't notify of success \n ${cmdResponseString}`);
        }
    } catch (e) {
        console.error(`    Error importing file from ${mediaPath}`, e);
    }
}

function addPostToCategory(postId, category) {
    runWpCli(`post update ${postId} --post_category=${category}`);
}

function createPostWithMedia(title, date, textContext, imageIds, videoIds) {
    const imagePaths = imageIds?.map((imageId) => ({id: imageId, path: runWpCli(`post get ${imageId} --field=guid`)})) ?? [];
    const videoPaths = videoIds?.map((videoId) => ({id: videoId, path: runWpCli(`post get ${videoId} --field=guid`)})) ?? [];

    const createParagraph = (text) => `<!-- wp:paragraph --><p>${text}</p><!-- /wp:paragraph -->`;
    const createImage = (id, path) => `<!-- wp:image {"id":${id},"sizeSlug":"large","linkDestination":"none"} --><figure class="wp-block-image size-large"><img src="${path}" alt="" class="wp-image-${id}"/></figure><!-- /wp:image -->`;
    const createVideo = (id, path) => `<!-- wp:video {"id":${id}} --><figure class="wp-block-video"><video controls src="${path}"></video></figure><!-- /wp:video -->`;
    const createGallery = (imagesContent) => `<!-- wp:gallery {"linkTo":"none","className":"is-style-masonry"} --><figure class="wp-block-gallery has-nested-images columns-default is-cropped is-style-masonry">${imagesContent}</figure><!-- /wp:gallery -->`;
    
    const galleryContents = imagePaths.map(({id, path}) => createImage(id, path)).join("") + videoPaths.map(({id, path}) => createVideo(id, path)).join("");
    const postContent = `${createParagraph(textContext)} ${createGallery(galleryContents)}`;

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

module.exports = {
    uploadImageToMediaLibrary,
    createPostWithMedia,
    addPostToCategory
}

