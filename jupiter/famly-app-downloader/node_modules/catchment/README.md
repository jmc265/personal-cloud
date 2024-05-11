# catchment

Collect stream data into a catchment.

`Catchment` extends `Writable`, and pushes incoming data into an array. When the stream is finished,
(e.g., `.end()` is called), a promise from `.promise` property is fulfilled with joined data. If an
error occurred, the promise is rejected.

## Example:

```js
const stream = require('stream')
const Catchment = require('catchment')

const Readable = stream.Readable

const data = 'test-data'
const catchment = new Catchment()

const rs = new Readable({
    read() {
        for (let i = 0; i < data.length; i++) {
            const c = data.charAt(i)
            this.push(c)
        }
        this.push(null)
    }
})
rs.pipe(catchment)

catchment.promise
    .then(console.log) // test-data
```

Copyright 2017 by
[sobesednik.media](https://sobesednik.media)
