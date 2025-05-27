const fs = require('fs');
const path = require('path');
const fetch = require('node-fetch');
const exiftool = require("node-exiftool");
const exiftoolBin = require("dist-exiftool");

const baseUrl = "https://app.famly.co/graphql";
const PHOTO_BASE_DIR = `${process.env.PRIMARY_STORAGE}/media/home`;
const existingIdsFile = '.ids';
let existingIds = '';
  
async function getAccessToken() {
    const res = await fetch(`${baseUrl}?Authenticate`, {
        "credentials": "include",
        "headers": {
            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:121.0) Gecko/20100101 Firefox/121.0",
            "Accept": "*/*",
            "Accept-Language": "en-GB,en;q=0.5",
            "content-type": "application/json",
            "x-famly-platform": "html",
            "x-famly-version": "5ec019ec5b",
            "x-famly-request-uuid": "a867e937-7056-4039-87d1-ea76ae96e09a",
            "x-famly-route": "/login",
            "x-famly-installationid": "1d5ab340-26f9-4517-9323-a1daa571a487",
            "sentry-trace": "8e6e104856ac480f9ae436768f92f9a5-8b97c42c2b278beb-0",
            "baggage": "sentry-environment=production,sentry-release=5ec019ec5b,sentry-transaction=%2Flogin,sentry-public_key=db8a16bb638f4264985f17bb9507c208,sentry-trace_id=8e6e104856ac480f9ae436768f92f9a5,sentry-sample_rate=0.01",
            "Sec-Fetch-Dest": "empty",
            "Sec-Fetch-Mode": "cors",
            "Sec-Fetch-Site": "same-origin",
            "Pragma": "no-cache",
            "Cache-Control": "no-cache"
        },
        "referrer": "https://app.famly.co/",
        "body": "{\"operationName\":\"Authenticate\",\"variables\":{\"email\":\"jamescross265@gmail.com\",\"password\":\"n*3a9LBL*slKruW\",\"deviceId\":\"92f5a67d-e150-46a3-89dc-2ca7d3c91ea4\",\"legacy\":false},\"query\":\"mutation Authenticate($email: EmailAddress!, $password: Password!, $deviceId: DeviceId, $legacy: Boolean) {\\n  me {\\n    authenticateWithPassword(\\n      email: $email\\n      password: $password\\n      deviceId: $deviceId\\n      legacy: $legacy\\n    ) {\\n      ...AuthenticationResult\\n      __typename\\n    }\\n    __typename\\n  }\\n}\\n\\nfragment AuthenticationResult on AuthenticationResult {\\n  status\\n  __typename\\n  ... on AuthenticationFailed {\\n    status\\n    errorDetails\\n    errorTitle\\n    __typename\\n  }\\n  ... on AuthenticationSucceeded {\\n    accessToken\\n    deviceId\\n    __typename\\n  }\\n  ... on AuthenticationChallenged {\\n    ...AuthChallenge\\n    __typename\\n  }\\n}\\n\\nfragment AuthChallenge on AuthenticationChallenged {\\n  loginId\\n  deviceId\\n  expiresAt\\n  choices {\\n    context {\\n      ...UserContextFragment\\n      __typename\\n    }\\n    hmac\\n    requiresTwoFactor\\n    __typename\\n  }\\n  person {\\n    name {\\n      fullName\\n      __typename\\n    }\\n    profileImage {\\n      url\\n      __typename\\n    }\\n    __typename\\n  }\\n  __typename\\n}\\n\\nfragment UserContextFragment on UserContext {\\n  id\\n  target {\\n    __typename\\n    ... on PersonContextTarget {\\n      person {\\n        name {\\n          fullName\\n          __typename\\n        }\\n        __typename\\n      }\\n      children {\\n        name {\\n          firstName\\n          fullName\\n          __typename\\n        }\\n        profileImage {\\n          url\\n          __typename\\n        }\\n        __typename\\n      }\\n      __typename\\n    }\\n    ... on InstitutionSet {\\n      title\\n      profileImage {\\n        url\\n        __typename\\n      }\\n      __typename\\n    }\\n  }\\n  __typename\\n}\"}",
        "method": "POST",
        "mode": "cors"
    });
    const body = await res.json();
    return body.data.me.authenticateWithPassword.accessToken;
}

async function getObservations(accessToken) {
    const res = await fetch(`${baseUrl}?LearningJourneyQuery`, {
        "credentials": "include",
        "headers": {
            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:108.0) Gecko/20100101 Firefox/108.0",
            "Accept": "*/*",
            "Accept-Language": "en-GB,en;q=0.5",
            "content-type": "application/json",
            "X-Famly-Accesstoken": accessToken,
            "X-Famly-Platform": "html",
            "X-Famly-Version": "1a26f2c40e",
            "X-Famly-Request-Uuid": "f4e401c6-8c2e-4f79-a422-a2337a9f7ebe",
            "X-Famly-Route": "/account/childProfile/:childId/childProfileLearningJourney",
            "X-Famly-InstallationId": "9bdcb75a-8b4e-45a4-8d5d-fb23bff7d30c",
            "Sec-Fetch-Dest": "empty",
            "Sec-Fetch-Mode": "cors",
            "Sec-Fetch-Site": "same-origin",
            "Pragma": "no-cache",
            "Cache-Control": "no-cache"
        },
        "body": "{\"operationName\":\"LearningJourneyQuery\",\"variables\":{\"childId\":\"f6d65e80-a631-46f5-9d86-495ac38cdb1b\",\"variants\":[\"REGULAR_OBSERVATION\",\"PARENT_OBSERVATION\",\"ASSESSMENT\",\"TWO_YEAR_PROGRESS\"],\"first\":1000},\"query\":\"query LearningJourneyQuery($childId: ChildId!, $observationIds: [ObservationId!], $variants: [ObservationVariant!], $next: ObservationCursor, $first: Int!) {\\n  childDevelopment {\\n    progress(childIds: [$childId]) {\\n      areaProgress {\\n        ...AreaProgressFragment\\n        __typename\\n      }\\n      __typename\\n    }\\n    behaviors(childId: $childId) {\\n      behaviorId\\n      ... on BehaviorUseObservationVersion {\\n        version\\n        __typename\\n      }\\n      __typename\\n    }\\n    observations(first: $first, childIds: [$childId], observationIds: $observationIds, statuses: [SENT], variants: $variants, after: $next) {\\n      results {\\n        ...ObservationDataWithCommentsImages\\n        __typename\\n      }\\n      next\\n      __typename\\n    }\\n    __typename\\n  }\\n}\\n\\nfragment ObservationDataWithCommentsImages on Observation {\\n  ...ObservationDataWithNoComments\\n  comments {\\n    count\\n    results {\\n      ...CommentWithImages\\n      __typename\\n    }\\n    __typename\\n  }\\n  __typename\\n}\\n\\nfragment Image on Image {\\n  id\\n  height\\n  width\\n  secret {\\n    crop\\n    expires\\n    key\\n    path\\n    prefix\\n    __typename\\n  }\\n  __typename\\n}\\n\\nfragment CommentWithImages on Comment {\\n  behaviors {\\n    id\\n    __typename\\n  }\\n  body\\n  id\\n  likes {\\n    count\\n    likedByMe\\n    likes {\\n      ...Like\\n      __typename\\n    }\\n    __typename\\n  }\\n  sentAt\\n  sentBy {\\n    name {\\n      fullName\\n      __typename\\n    }\\n    profileImage {\\n      url\\n      __typename\\n    }\\n    __typename\\n  }\\n  images {\\n    ...Image\\n    __typename\\n  }\\n  canReport\\n  __typename\\n}\\n\\nfragment Like on Like {\\n  likedAt\\n  likedBy {\\n    profileImage {\\n      url\\n      __typename\\n    }\\n    name {\\n      firstName\\n      fullName\\n      __typename\\n    }\\n    __typename\\n  }\\n  __typename\\n}\\n\\nfragment ObservationDataWithNoComments on Observation {\\n  children {\\n    id\\n    name\\n    institutionId\\n    profileImage {\\n      url\\n      __typename\\n    }\\n    __typename\\n  }\\n  id\\n  version\\n  feedItem {\\n    id\\n    __typename\\n  }\\n  createdBy {\\n    name {\\n      fullName\\n      __typename\\n    }\\n    profileImage {\\n      url\\n      __typename\\n    }\\n    __typename\\n  }\\n  status {\\n    state\\n    createdAt\\n    __typename\\n  }\\n  variant\\n  settings {\\n    assessmentSetting {\\n      assessmentSettingsId\\n      title\\n      __typename\\n    }\\n    __typename\\n  }\\n  behaviors {\\n    id\\n    ... on BehaviorCanLinkToFrameworks {\\n      ...BehaviorCanLinkToFrameworks\\n      __typename\\n    }\\n    ... on BehaviorObservationVariantAmbiguity {\\n      variants\\n      __typename\\n    }\\n    __typename\\n  }\\n  remark {\\n    id\\n    body\\n    richTextBody\\n    date\\n    statements {\\n      refinement\\n      statement {\\n        body\\n        id\\n        area {\\n          frameworkId\\n          id\\n          lower\\n          upper\\n          title\\n          abbr\\n          color\\n          deletedAt\\n          subAreas {\\n            title\\n            __typename\\n          }\\n          __typename\\n        }\\n        __typename\\n      }\\n      __typename\\n    }\\n    areas {\\n      area {\\n        frameworkId\\n        id\\n        parentId\\n        title\\n        description\\n        abbr\\n        color\\n        placement\\n        deletedAt\\n        framework {\\n          id\\n          title\\n          owner\\n          __typename\\n        }\\n        __typename\\n      }\\n      refinement\\n      note\\n      areaRefinementSettings {\\n        ageBandSetting {\\n          ...AgeBandSetting\\n          __typename\\n        }\\n        assessmentOptionSetting {\\n          ...AssessmentOptionSetting\\n          __typename\\n        }\\n        __typename\\n      }\\n      __typename\\n    }\\n    __typename\\n  }\\n  nextStep {\\n    id\\n    body\\n    richTextBody\\n    __typename\\n  }\\n  files {\\n    name\\n    url\\n    id\\n    __typename\\n  }\\n  images {\\n    height\\n    width\\n    id\\n    secret {\\n      crop\\n      expires\\n      key\\n      path\\n      prefix\\n      __typename\\n    }\\n    __typename\\n  }\\n  video {\\n    ... on TranscodingVideo {\\n      id\\n      __typename\\n    }\\n    ... on TranscodedVideo {\\n      duration\\n      height\\n      id\\n      thumbnailUrl\\n      videoUrl\\n      width\\n      __typename\\n    }\\n    __typename\\n  }\\n  likes {\\n    count\\n    likedByMe\\n    likes {\\n      ...Like\\n      __typename\\n    }\\n    __typename\\n  }\\n  canReport\\n  __typename\\n}\\n\\nfragment BehaviorCanLinkToFrameworks on BehaviorCanLinkToFrameworks {\\n  id\\n  __typename\\n  frameworks {\\n    ...MinimalFramework\\n    __typename\\n  }\\n}\\n\\nfragment MinimalFramework on Framework {\\n  id\\n  title\\n  abbr\\n  areas {\\n    title\\n    description\\n    abbr\\n    color\\n    id\\n    __typename\\n  }\\n  __typename\\n}\\n\\nfragment AgeBandSetting on AgeBandSetting {\\n  ageBandSettingId\\n  id: ageBandSettingId\\n  assessmentSettingsId\\n  from\\n  to\\n  label\\n  __typename\\n}\\n\\nfragment AssessmentOptionSetting on AssessmentOptionSetting {\\n  assessmentOptionSettingId\\n  id: assessmentOptionSettingId\\n  assessmentSettingsId\\n  backgroundColor\\n  fontColor\\n  label\\n  __typename\\n}\\n\\nfragment AreaProgressFragment on ChildDevelopmentAreaProgress {\\n  area {\\n    id\\n    title\\n    color\\n    abbr\\n    __typename\\n  }\\n  subAreaProgress {\\n    area {\\n      abbr\\n      title\\n      id\\n      __typename\\n    }\\n    progressAssessment\\n    ageBands: subAreaProgress {\\n      completion\\n      __typename\\n    }\\n    lowestUncompletedAgeBands: subAreaProgress(filter: LowestUncompletedAgeBand) {\\n      area {\\n        id\\n        title\\n        lower\\n        upper\\n        __typename\\n      }\\n      ...AreaProgressLatestLink\\n      completion\\n      __typename\\n    }\\n    __typename\\n  }\\n  __typename\\n}\\n\\nfragment AreaProgressLatestLink on ChildDevelopmentAreaProgress {\\n  latestLink {\\n    refinement\\n    __typename\\n  }\\n  __typename\\n}\\n\"}",
        "method": "POST",
        "mode": "cors"
    });
    const body = await res.json();
    return body.data.childDevelopment.observations.results;
}

async function getNotes(accessToken) {
    const res = await fetch(`${baseUrl}?GetChildNotes`, {
        "credentials": "include",
        "headers": {
            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0",
            "Accept": "*/*",
            "Accept-Language": "en-GB,en;q=0.5",
            "content-type": "application/json",
            "sentry-trace": "a35637a1c0de471c82f9d97030f9bdb8-83b27bba4967cb93-0",
            "X-Famly-Accesstoken": accessToken,
            "X-Famly-Platform": "html",
            "X-Famly-Version": "60e6484679",
            "X-Famly-Request-Uuid": "ce0048ad-8135-4e73-906f-ff4afe949ee7",
            "X-Famly-Route": "/account/childProfile/:childId/childProfileNotes",
            "X-Famly-InstallationId": "9bdcb75a-8b4e-45a4-8d5d-fb23bff7d30c",
            "Sec-Fetch-Dest": "empty",
            "Sec-Fetch-Mode": "cors",
            "Sec-Fetch-Site": "same-origin",
            "Pragma": "no-cache",
            "Cache-Control": "no-cache"
        },
        "body": "{\"operationName\":\"GetChildNotes\",\"variables\":{\"noteTypes\":[\"Classic\"],\"childId\":\"f6d65e80-a631-46f5-9d86-495ac38cdb1b\",\"parentVisible\":true,\"safeguardingConcern\":false,\"sensitive\":false,\"limit\":1000},\"query\":\"query GetChildNotes($childId: ChildId!, $cursor: ChildNoteCursor, $limit: Int!, $parentVisible: Boolean, $safeguardingConcern: Boolean, $sensitive: Boolean, $noteIds: [ChildNoteId!], $noteTypes: [ChildNoteType!], $showDrafts: Boolean, $isAcknowledgedByParent: Boolean) {\\n  childNotes(childIds: [$childId], cursor: $cursor, limit: $limit, parentVisible: $parentVisible, safeguardingConcern: $safeguardingConcern, sensitive: $sensitive, noteIds: $noteIds, noteTypes: $noteTypes, drafts: $showDrafts, isAcknowledgedByParent: $isAcknowledgedByParent) {\\n    __typename\\n    next\\n    result {\\n      ...Note\\n      __typename\\n    }\\n  }\\n}\\n\\nfragment Note on ChildNote {\\n  __typename\\n  noteType\\n  child {\\n    id\\n    institutionId\\n    __typename\\n  }\\n  modifiedAt\\n  modifiedBy {\\n    ...Author\\n    __typename\\n  }\\n  createdBy {\\n    ...Author\\n    __typename\\n  }\\n  id: noteId\\n  parentVisible\\n  sensitive\\n  text\\n  safeguardingConcern\\n  createdAt\\n  publishedAt\\n  files {\\n    id\\n    name\\n    url\\n    __typename\\n  }\\n  images {\\n    height\\n    id\\n    secret {\\n      crop\\n      expires\\n      key\\n      path\\n      prefix\\n      __typename\\n    }\\n    width\\n    __typename\\n  }\\n  behaviors {\\n    id\\n    __typename\\n  }\\n  parentAcknowledgements {\\n    ...NoteAcknowledgement\\n    __typename\\n  }\\n}\\n\\nfragment Author on Person {\\n  name {\\n    fullName\\n    __typename\\n  }\\n  profileImage {\\n    url\\n    __typename\\n  }\\n  __typename\\n}\\n\\nfragment NoteAcknowledgement on ChildNoteSignature {\\n  id\\n  targetId\\n  acknowledgedAt\\n  acknowledgedBy {\\n    name {\\n      fullName\\n      __typename\\n    }\\n    __typename\\n  }\\n  __typename\\n}\\n\"}",
        "method": "POST",
        "mode": "cors"
    });
    const body = await res.json();
    return body.data.childNotes.result;
}

function formatDate(date) {
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    return `${year}-${month}-${day}`;
}

async function downloadObservation(observation) {
    const {id, status: {createdAt}, remark: {body, date}, images, video} = observation;
    const createdDate = new Date(createdAt);
    console.log(`Found observation`, {id});
    if (existingIds.includes(id)) {
        console.log("    Observation already downloaded");
        return;
    }
    const targetDirectory = `${PHOTO_BASE_DIR}/${createdDate.getFullYear()}/Nursery/${formatDate(createdDate)}-${id}`;
    fs.mkdirSync(targetDirectory);
    
    const imagePaths = await Promise.all(images.map((image) => downloadImage(image, createdDate, targetDirectory)));
    const videoPath = await downloadVideo(video, createdDate, targetDirectory);
    
    writeFile(targetDirectory, body, createdDate, imagePaths, videoPath);

    fs.appendFileSync(existingIdsFile, id+"\r\n");
}

async function downloadNote(note) {
    const {id, images, createdAt, text, video} = note;
    const createdDate = new Date(createdAt);
    console.log("Found note", {id});
    if (existingIds.includes(id)) {
        console.log("    Note already downloaded");
        return;
    }
    const targetDirectory = `${PHOTO_BASE_DIR}/${createdDate.getFullYear()}/Nursery/${formatDate(createdDate)}-${id}`;
    fs.mkdirSync(targetDirectory);

    const imagePaths = await Promise.all(images.map((image) => downloadImage(image, createdDate, targetDirectory)));
    const videoPath = await downloadVideo(video, createdDate, targetDirectory);
    
    writeFile(targetDirectory, text, createdDate, imagePaths, videoPath);

    fs.appendFileSync(existingIdsFile, id+"\r\n");
}

function writeFile(targetDirectory, body, createdDate, imagePaths, videoPath) {
    const imageFileNames = imagePaths.map((p) => path.basename(p));
    const videoFileName = videoPath ? path.basename(videoPath) : null;

    const markdownContent = `---
date: ${createdDate.toISOString()}
---
${body}

${imageFileNames.map((fileName) => `![](./${fileName})`).join('\n')}
${videoFileName ? `<video src="${videoFileName}"></video>` : ''}
`;

    fs.writeFileSync(`${targetDirectory}/observation.md`, markdownContent);
}

async function downloadImage(imageObj, date, targetDirectory) {
    const {id, height, width, secret:{key, path, prefix, expires}} = imageObj;
    const imageUrl = `${prefix}/${key}/${width}x${height}/${path}?expires=${expires}`;
    const imagePath = `${targetDirectory}/${id}.jpg`;
    console.log(`  Found image`, {id});
    let ep;
    try {
        const res = await fetch(imageUrl);
        if (!res.ok) {
            throw new Error(`Failed to fetch the image file. Status code: ${res.status}`);
        }
        await new Promise((resolve, reject) => {
            const fileStream = fs.createWriteStream(imagePath); 
            res.body.pipe(fileStream);
            res.body.on('error', (err) => {
                reject(err);
            });
            fileStream.on('finish', function () {
                resolve();
            });
        });
        ep = new exiftool.ExiftoolProcess(exiftoolBin);
        await ep.open();
        const exifDate = `${date.getFullYear()}:${date.getMonth()+1}:${date.getDate()} 12:00:00`;
        const exifUpdates = {
            "DateTimeOriginal"                : exifDate,
            "DateTime"                        : exifDate,
            "DateTimeDigitized"               : exifDate,
            "DateTimeOriginal"                : exifDate,
            "DateTime"                        : exifDate,
        };
        await ep.writeMetadata(imagePath, exifUpdates, ['overwrite_original']);
        console.log("    Image downloaded", {imagePath});
        return imagePath;
    } catch (e) {
        console.error('    Error updating exif', e);
    } finally {
        if (ep && ep.isOpen) {
            await ep.close();
        }
    }
}

async function downloadVideo(videoObj, date, targetDirectory) {
    if (!videoObj) {
        return;
    }
    const { id, videoUrl } = videoObj;
    console.log(`  Found video`, {id});
    const videoPath = `${targetDirectory}/${id}.mp4`;
    try {
        const res = await fetch(videoUrl);
        if (!res.ok) {
            throw new Error(`Failed to fetch the video file. Status code: ${res.status}`);
        }
        await new Promise((resolve, reject) => {
            const fileStream = fs.createWriteStream(videoPath); 
            res.body.pipe(fileStream);
            res.body.on('error', (err) => {
                reject(err);
            });
            fileStream.on('finish', function () {
                resolve();
            });
        });
        console.log("    Video downloaded", {videoPath});
        return videoPath;
    } catch (e) {
        console.error('    Error downloading video', e);
    }
}

existingIds = fs.readFileSync(existingIdsFile, {encoding:'utf8', flag:'r'});

getAccessToken()
    .then(async (accessToken) => {
        await getObservations(accessToken)
            .then(async (observations) => {
                for (let observation of observations) {
                    await downloadObservation(observation)
                }
            });
        await getNotes(accessToken)
            .then(async (notes) => {
                for (let note of notes) {
                    await downloadNote(note)
                }
            });
    });