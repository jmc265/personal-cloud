const assert = require('assert')
const wrote = require('../')

wrote.read(__filename)
    .then((res) => {
        console.log(res)
        assert(res.startsWith("const assert = require('assert')"))
    })
    .catch(console.error)
