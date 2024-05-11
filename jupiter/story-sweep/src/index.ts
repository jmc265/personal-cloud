import { getAllFavouritePhotosForMonth } from "./photo-prism";
import { getAllMemoryCardsForMonth } from "./trello";
import { createPageForMonth } from "./wordpress";
import {endOfMonth} from 'date-fns';
import { askQuestion } from "./utils";

async function runStorySweep(date: Date) {
    const monthEndDate = endOfMonth(date);
    console.log('Running for '+ monthEndDate);
    const images = getAllFavouritePhotosForMonth(monthEndDate);
    // const memoryCards = await getAllMemoryCardsForMonth();

    await createPageForMonth(monthEndDate, images, []);
}

async function run() {
    const year = Number(await askQuestion('What year?: '));
    const month = Number(await askQuestion('What month? (1-12): '));

    await runStorySweep(new Date(year, month-1, 1));
}

run().then(() => console.log('All finished'));


