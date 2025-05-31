#!/bin/node
const { execSync } = require("child_process");
const fs = require('fs');
const path = require('path');

// Configure these variables
const SQL_PASSWORD = process.env.SQL_PASSWORD;
const DOCKER_APP_DATA = process.env.DOCKER_APP_DATA;
const PRIMARY_STORAGE = process.env.PRIMARY_STORAGE;
const PHOTO_BASE_DIR = `${process.env.PRIMARY_STORAGE}/media/home`;
const PHOTO_SIDECAR_BASE_DIR = `${DOCKER_APP_DATA}/photoprism/sidecar/photos`;
const POST_TITLE = 'Nursery Observation';


// Function to download an image and save it to a folder
async function downloadImage(url, folderPath, fileName) {
  const localUrl = url.replace('jupiter', 'localhost');
  try {
    const response = await fetch(url);
    if (!response.ok) throw new Error(`Failed to fetch ${url}: ${response.statusText}`);
    const arrayBuffer = await response.arrayBuffer(); // Use arrayBuffer
    const buffer = Buffer.from(arrayBuffer); // Convert arrayBuffer to Buffer
    const filePath = path.join(folderPath, fileName);
    fs.writeFileSync(filePath, buffer);
    console.log(`Image downloaded: ${filePath}`);
  } catch (error) {
    console.error(`Error downloading image ${localUrl}:`, error.message);
  }
}

async function processData(data) {
  const outputDir = path.join(__dirname, 'output');

  // Create output directory if it doesn't exist
  if (!fs.existsSync(outputDir)) {
    fs.mkdirSync(outputDir);
  }

  for (const item of data) {
    // Format the date to create a folder
    const folderName = new Date(item.postDate).toISOString().split('T')[0]; // e.g., "2024-11-22"
    const folderPath = path.join(outputDir, folderName);

    // Create the folder if it doesn't exist
    if (!fs.existsSync(folderPath)) {
      fs.mkdirSync(folderPath);
    }

    // Download all images
    const imagePaths = [];
    for (const [index, imageUrl] of item.images.entries()) {
      const fileName = `image-${index + 1}${path.extname(imageUrl)}`; // e.g., "image-1.jpg"
      await downloadImage(imageUrl, folderPath, fileName);
      imagePaths.push(`./${fileName}`); // Markdown relative path
    }

    // Create the observation.md file
    const observationFile = path.join(folderPath, 'observation.md');
    const markdownContent = [
      '---',
      `date: ${new Date(item.postDate).toISOString()}`,
      '---',
      item.content.join('\n\n'), // Add the content text
      ...imagePaths.map(imgPath => `![Image](${imgPath})`) // Add Markdown image links
    ].join('\n\n');

    fs.writeFileSync(observationFile, markdownContent);
    console.log(`Observation file created: ${observationFile}`);
  }
}


try {
  // Define the SQL query to find all posts with the specified title
  const sql = `SELECT * FROM wp_posts WHERE post_title = '${POST_TITLE}'`;

  // Prepare the Docker command to execute the query
  const command = `docker run --rm \
    -v ${DOCKER_APP_DATA}/wordpress/html:/var/www/html \
    -v ${PRIMARY_STORAGE}/media/home:${PRIMARY_STORAGE}/media/home:ro \
    -v ${PHOTO_SIDECAR_BASE_DIR}:${PHOTO_SIDECAR_BASE_DIR}:ro \
    --env=WORDPRESS_DB_HOST=wordpress-db \
    --env=WORDPRESS_DB_USER=wordpress \
    --env=WORDPRESS_DB_PASSWORD=${SQL_PASSWORD} \
    --env=WORDPRESS_DB_NAME=wordpress \
    --network=wordpress_default \
    wordpress:cli db query "${sql}"`;

  // Execute the command and capture the output
  const output = execSync(command, { encoding: 'utf-8' });

  if (output.trim()) {
    const strucutred = output.split('\n').map((row) => {
      const cells = row.split('\t');
      const rawContent = cells[4];
      if (!rawContent) {
        console.warn('no content', row);
        return null;
      }
      if (cells[7] !== 'publish') {
        return null;
      }
      const images = [...rawContent.matchAll(/src="(.*?)"/g)].map(a => a[1].replace('\\n', ''));
      const content = [...rawContent.matchAll(/<p>(.*?)<\/p>/g)].map(a => a[1].replaceAll('\\n', ''));
      // if (cells[0] === 'ID' || cells[0] === '2666' || cells[0] === '2667') {
      //   console.log(cells);
      // }
      return {
        id: cells[0],
        postDate: new Date(cells[2]),
        images,
        content,
      }
    }).filter(Boolean);

    console.log(JSON.stringify(strucutred, null, 2));

    processData(strucutred);
  } else {
    console.log('No posts found with the title "Nursery Observation".');
  }
} catch (error) {
  console.error('Error executing SQL command:', error.message);
  console.error('Full error:', error);
}
