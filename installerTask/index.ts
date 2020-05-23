import tl = require('azure-pipelines-task-lib/task');
import { getChocolatey } from './chocolateyGetter';

async function run() {
    try {
        const location = await getChocolatey();

        // const inputString: string | undefined = tl.getInput('samplestring', true);
        // if (inputString == 'bad') {
        //     tl.setResult(tl.TaskResult.Failed, 'Bad input was given');
        //     return;
        // }
        console.log('Hello', location);
    }
    catch (err) {
        tl.setResult(tl.TaskResult.Failed, err.message);
    }
}

run();