import { exec } from 'child_process';
import * as dotenv from "dotenv";
dotenv.config();

const runGithubCLI = (token: string) => {
  const command = `gh pr list \
    --repo "edash-product/e-dash-app" \
    --search "created:2024-04-01..2025-03-31 author:TakuoIshida" \
    --state merged \
    --limit 1000 \
    --json number \
    --jq 'length'`;
  console.log(command)
  exec(command, {
    env: {
      ...process.env,
      GITHUB_TOKEN: token, // トークンを明示的に渡す
    },
  }, (error, stdout, stderr) => {
    if (error) {
      console.error(`エラーが発生しました: ${error.message}`);
      return;
    }
    if (stderr) {
      console.error(`stderr: ${stderr}`);
      return;
    }
    console.log(`結果:\n${stdout}`);
  });
};

// 例：実行時に環境変数から取得（推奨）
const token = process.env.GITHUB_TOKEN;

if (!token) {
  console.error('GITHUB_TOKEN が設定されていません');
  process.exit(1);
}

runGithubCLI(token);
