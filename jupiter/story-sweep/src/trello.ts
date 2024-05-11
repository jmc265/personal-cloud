import Trello from "trello";
import fs from 'fs';
import os from 'os';
import path from 'path';
import fetch from 'node-fetch';

const trelloApiKey = process.env.TRELLO_API_KEY;
const trelloApiToken = process.env.TRELLO_API_TOKEN;
const trelloListId = "65b125487c14b35a316b6914";

const trello = new Trello(trelloApiKey, trelloApiToken);

export type TrelloCard = {
  id: string;
  desc: string;
  name: string;
  cover: {
    idAttachment: null;
    idUploadedBackground: null;
  };
  attachments: TrelloAttachment[]
};

export type TrelloAttachment = {
    id: string;
    date: string;
    name: string;
    url: string;
    fileName: string;
    filePath: string;
  }

export async function getAllMemoryCardsForMonth(): Promise<TrelloCard[]> {
  const cards: TrelloCard[] = await trello.getCardsOnList(trelloListId);
  return Promise.all(cards.map(async (card) => ({
    ...card,
    attachments: await Promise.all((await trello.getAttachmentsOnCard(card.id)).map((attachment: TrelloAttachment) => downloadAttachment(attachment)))
  })));
}

export async function clearList() {
  const cards: TrelloCard[] = await trello.getCardsOnList(trelloListId);
  for (const card of cards) {
    await trello.deleteCard(card.id);
  }
}

export async function downloadAttachment(attachment: TrelloAttachment): Promise<TrelloAttachment> {
    const tempFolderPath = os.tmpdir();

    const response = await fetch(attachment.url, {headers: {
        'Authorization': `OAuth oauth_consumer_key="${trelloApiKey}", oauth_token="${trelloApiToken}"`
    }});    
    if (!response.ok) {
        throw new Error(`Failed to download image: ${response.status} ${response.statusText}`);
    }
    const filePath = path.join(tempFolderPath, attachment.fileName);
    const fileStream = fs.createWriteStream(filePath);
    await new Promise((resolve, reject) => {
        response.body?.pipe(fileStream);
        response.body?.on('error', (err: unknown) => {
            reject(err);
        });
        fileStream.on('finish', function () {
            resolve(null);
        });
    });
    return {
        ...attachment,
        filePath
    };
}
