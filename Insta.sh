import readline from 'readline';
import chalk from 'chalk';

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// Stylish application selection prompt
console.log(chalk.bold.blue('\n===== Please Select Your Application =====\n'));

console.log(chalk.cyan(`
1) Instagram     2) Facebook
3) Twitter       4) Tiktok
5) Gmail         6) Snapchat
7) Likee
`));

const appPrompts = {
  1: 'username',
  2: 'link',
  3: 'username',
  4: 'username',
  5: 'email address',
  6: 'username',
  7: 'username',
};

// User selection and account detail prompt
rl.question(chalk.yellow('Select an option (1-7): '), (appOption) => {
  const promptText = appPrompts[appOption] || 'username';
  rl.question(chalk.yellowBright(`\nPlease enter your example account's ${promptText}.\n\n${chalk.redBright('And your API provider will receive 5$ from your wallet after the action❗')}\n`), (account) => {

    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const nums = '0123456789';
    const signs = '@';

    let counter = 0;
    const start = Date.now();
    const end = start + 20000; // 20 seconds from start

    function generateCombo(index) {
      const c1 = chars[index % chars.length];
      const c2 = chars[(index + 1) % chars.length];
      const c3 = chars[(index + 2) % chars.length];
      const c4 = chars[(index + 3) % chars.length];
      const c5 = chars[(index + 4) % chars.length];
      const c6 = chars[(index + 5) % chars.length];
      const c7 = chars[(index + 6) % chars.length];
      const c8 = nums[(index + 7) % nums.length];
      const c9 = nums[(index + 8) % nums.length];
      const c10 = signs[0];

      return `${c1}${c2}${c3}${c4}${c5}${c6}${c7}${c8}${c9}${c10}`;
    }

    function attemptPassword() {
      const combo = generateCombo(counter);

      // Stylish logging of each password attempt
      console.log(chalk.magenta.bold(`Trying password: ${combo}`));
      
      if (combo === 'RATAN@9090' || Date.now() > end) {
        console.log(chalk.magenta.bold(`Trying password: ${combo}`));
        console.log(chalk.greenBright.bold(`Succeed, the password is RATAN@9090`));
        rl.close();
        return;
      }

      counter++;
      
      // Trigger the next password attempt immediately
      setImmediate(attemptPassword);
    }

    attemptPassword();
  });
});
