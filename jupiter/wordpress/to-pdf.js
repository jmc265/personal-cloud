const puppeteer = require('puppeteer');

const classesToHide = [
    '.sidebar',
    '.post-categories',
    '.post-navigation',
    'figure:has(video)'
];
const postUrlRegex = /(.*)\/?p=(\d*)/;
const outputDir = '/home/pptruser/output';
const pageWaitTime = 20 * 1000;

const getAllPostIdsFromPage = async (browser, pageNumber) => {
    console.log(`Getting posts from page ${pageNumber}`);
    const page = await browser.newPage();
    await page.goto(`http://jupiter:6543/?paged=${pageNumber}`, { waitUntil: 'networkidle0' });
    const hrefs = await page.$$eval('a', as => as.map(a => a.href));
    const matches = hrefs.map((href) => postUrlRegex.exec(href))
        .filter((matches) => matches && matches.length === 3)
        .map((matches) => matches[2]);
    await page.close();
    return matches;
}

const savePostToPDF = async (browser, postId) => {
    console.log(`Start savePostToPDF(${postId})`);
    const page = await browser.newPage();
    try {
        page.setRequestInterception(true);
        page.on('request', (request) => {
            if (request.url().endsWith('.mp4')) {
                request.abort();
                return;
            }
            request.continue();
        });

        await page.goto(`http://jupiter:6543/?p=${postId}`, { waitUntil: 'networkidle0', timeout: 0 });

        const css = classesToHide.map((className) => `${className} { display: none !important; }`).join(' ');
        await page.addStyleTag({ content: css });
        
        const h1Element = await page.waitForSelector('h1');
        const postTitle = await h1Element.evaluate(el => el.textContent);
        const postDateElement = await page.waitForSelector('.post-date');
        const postDateElementContents = await postDateElement.evaluate(el => el.textContent);
        const postDate = new Date(postDateElementContents);
        const postDateString = `${postDate.getFullYear()}-${('0' + (postDate.getMonth()+1)).slice(-2)}-${('0' + (postDate.getDate()+1)).slice(-2)}`;

        await new Promise((resolve) => setTimeout(resolve, pageWaitTime));

        // PDF generation results in HUGE files!
        // await page.pdf({ 
        //     path: `${outputDir}/${postDateString} - ${postTitle}.pdf`, 
        //     timeout: 0,
        //     format: 'A4'
        // });
        await page.setViewport({ width: 0, height: 0 });
        await page.screenshot({ 
            path: `${outputDir}/${postDateString} - ${postTitle}.png`, 
            fullPage: true,
         });
    }  catch (e) {
        console.error(`Error in savePostToPDF(${postId})`, e);
    } finally {
        await page.close();
    }
};


(async () => {
    const browser = await puppeteer.launch({ 
        headless: "shell", 
        defaultViewport: null,
        args: [
            '--window-size=1920,1080',
        ],
     });

    const allPostIds = [];
    let page = 1;
    while(true) {
        const postIds = await getAllPostIdsFromPage(browser, page);
        if (!postIds || postIds.length <= 0) {
            break;
        }
        page++;
        allPostIds.push(...postIds);
    }

    const distinctPostsIds = allPostIds.filter((a, index) => allPostIds.findIndex((b) => a === b) === index);
    for (const postId of distinctPostsIds) {
        await savePostToPDF(browser, postId);
    }

    await browser.close();
})();
