// unpacked/launcher/encode_password.js
const crypto = require('crypto');

const DIGEST = 'sha512';
const ITERATIONS = 1000;
const KEYLEN = 64;
const LOW_SODIUM = '17c4f39053ac5a50d5797c665ad1f4e6';
const CUSTOM_SALT = process.env.FOUNDRY_PASSWORD_SALT || LOW_SODIUM;

process.stdin.setEncoding('utf8');
process.stdin.once('data', (PLAINTEXT) => {
  PLAINTEXT = PLAINTEXT.trim();
  const hash = crypto.pbkdf2Sync(
    PLAINTEXT,
    CUSTOM_SALT,
    ITERATIONS,
    KEYLEN,
    DIGEST
  );
  process.stdout.write(hash.toString('hex'));
});