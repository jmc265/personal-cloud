const path = require('path');
const execFile = require('child_process').execFile;
const assert = require('assert');
const exiftool = require('../index');

describe('exiftool', function () {
	it('should export a path to current executable', function () {
		const exePath = path.join(__dirname, '../vendor/exiftool');
		assert.equal(exiftool, exePath);
	});
	it('should be able to run the executable', function (done) {
		execFile(exiftool, ['-echo', 'test-out', '-echo2', 'test-err'], (err, stdout, stderr) => {
			if (err) {
				done(err);
				return;
			}
			assert.equal(stdout.trim(), 'test-out');
			assert.equal(stderr.trim(), 'test-err');
			done();
		});
	});
	it('should have version 10.53', function (done) {
		execFile(exiftool, ['-ver'], (err, stdout, stderr) => {
			if (err) {
				done(err);
				return;
			}
			assert.equal(stdout.trim(), '10.53');
			done();
		});
	});
});
