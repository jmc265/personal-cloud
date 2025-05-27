"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
const photo_prism_1 = require("./photo-prism");
const wordpress_1 = require("./wordpress");
const date_fns_1 = require("date-fns");
const utils_1 = require("./utils");
function runStorySweep(date) {
    return __awaiter(this, void 0, void 0, function* () {
        const monthEndDate = (0, date_fns_1.endOfMonth)(date);
        console.log('Running for ' + monthEndDate);
        const images = (0, photo_prism_1.getAllFavouritePhotosForMonth)(monthEndDate);
        // const memoryCards = await getAllMemoryCardsForMonth();
        yield (0, wordpress_1.createPageForMonth)(monthEndDate, images, []);
    });
}
function run() {
    return __awaiter(this, void 0, void 0, function* () {
        const year = Number(yield (0, utils_1.askQuestion)('What year?: '));
        const month = Number(yield (0, utils_1.askQuestion)('What month? (1-12): '));
        yield runStorySweep(new Date(year, month - 1, 1));
    });
}
run().then(() => console.log('All finished'));
