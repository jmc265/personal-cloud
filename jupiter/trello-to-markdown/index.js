const Trello = require('trello');
const fs = require('fs');

const trelloApiKey = process.env.TRELLO_API_KEY;
const trelloApiToken = process.env.TRELLO_API_TOKEN;

const trello = new Trello(trelloApiKey, trelloApiToken);

async function getAllBoards() {
  try {
    const boards = await trello.getBoards("me");
    return boards;
  } catch (err) {
    console.log(err);
  }
}

async function createMarkdownFiles() {
  const boards = await getAllBoards();
  boards.forEach(async (board) => {
    try {
      const lists = await trello.getListsOnBoard(board.id);
      const boardName = board.name.replace(/ /g, "-").toLowerCase();
      let markdown = `# ${board.name}\n`;
      for (const list of lists) {
        const cards = await trello.getCardsOnList(list.id);
        markdown += `## ${list.name}\n`;
        for (const card of cards) {
          markdown += `### ${card.name}\n`;
          if (card.desc) {
            markdown += `${card.desc}\n`;
          }
          // Output actions
          const actions = await trello.getActionsOnCard(card.id);
          for (const action of actions) {
            if (action.data.text) {
              markdown += `**Action:**\n`;
              markdown += `${action.data.text}\n`;
            }
          }
          // Output checklists
          const checklists = await trello.getChecklistsOnCard(card.id);
          for (const checklist of checklists) {
            markdown += `**${checklist.name}:**\n`;
            const items = checklist.checkItems.map(
              (item) => `* ${item.name} (${item.state})`
            );
            markdown += `${items.join("\n")}\n`;
          }
          // Output attachments
          const attachments = await trello.getAttachmentsOnCard(card.id);
          for (const attachment of attachments) {
            markdown += `**Attachment:**\n`;
            markdown += `[${attachment.name}](${attachment.url})\n`;
          }
        }
      }
      fs.writeFileSync(`${process.env.WORKSPACE_DIR}/04-Archive/Trello/${boardName}.md`, markdown);
    } catch (err) {
      console.log(err);
    }
  });
}


createMarkdownFiles();