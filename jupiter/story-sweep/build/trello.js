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
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.downloadAttachment = exports.clearList = exports.getAllMemoryCardsForMonth = void 0;
const trello_1 = __importDefault(require("trello"));
const fs_1 = __importDefault(require("fs"));
const os_1 = __importDefault(require("os"));
const path_1 = __importDefault(require("path"));
const node_fetch_1 = __importDefault(require("node-fetch"));
const trelloApiKey = process.env.TRELLO_API_KEY;
const trelloApiToken = process.env.TRELLO_API_TOKEN;
const trelloListId = "65b125487c14b35a316b6914";
const trello = new trello_1.default(trelloApiKey, trelloApiToken);
function getAllMemoryCardsForMonth() {
    return __awaiter(this, void 0, void 0, function* () {
        const cards = yield trello.getCardsOnList(trelloListId);
        return Promise.all(cards.map((card) => __awaiter(this, void 0, void 0, function* () {
            return (Object.assign(Object.assign({}, card), { attachments: yield Promise.all((yield trello.getAttachmentsOnCard(card.id)).map((attachment) => downloadAttachment(attachment))) }));
        })));
    });
}
exports.getAllMemoryCardsForMonth = getAllMemoryCardsForMonth;
function clearList() {
    return __awaiter(this, void 0, void 0, function* () {
        const cards = yield trello.getCardsOnList(trelloListId);
        for (const card of cards) {
            yield trello.deleteCard(card.id);
        }
    });
}
exports.clearList = clearList;
function downloadAttachment(attachment) {
    return __awaiter(this, void 0, void 0, function* () {
        const tempFolderPath = os_1.default.tmpdir();
        const response = yield (0, node_fetch_1.default)(attachment.url, { headers: {
                'Authorization': `OAuth oauth_consumer_key="${trelloApiKey}", oauth_token="${trelloApiToken}"`
            } });
        if (!response.ok) {
            throw new Error(`Failed to download image: ${response.status} ${response.statusText}`);
        }
        const filePath = path_1.default.join(tempFolderPath, attachment.fileName);
        const fileStream = fs_1.default.createWriteStream(filePath);
        yield new Promise((resolve, reject) => {
            var _a, _b;
            (_a = response.body) === null || _a === void 0 ? void 0 : _a.pipe(fileStream);
            (_b = response.body) === null || _b === void 0 ? void 0 : _b.on('error', (err) => {
                reject(err);
            });
            fileStream.on('finish', function () {
                resolve(null);
            });
        });
        return Object.assign(Object.assign({}, attachment), { filePath });
    });
}
exports.downloadAttachment = downloadAttachment;
