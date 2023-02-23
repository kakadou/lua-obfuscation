/* 

    Gab1tzu's run system

*/

/*
Gonna update soon!
*/

const fs = require('fs')


require('./index.js').obfuscate(
    fs.readFileSync('D:/Amethyst/src/temp/input.lua').toString() // change the directory to the directory of your src/temp/input.lua !
).then(([ outputPath, settings ]) => {
    console.log(`saved to '${outputPath}'`)
    //fs.unlinkSync(outputPath)
}).catch((err) => {
    console.log("FAIOIIL", err)
})