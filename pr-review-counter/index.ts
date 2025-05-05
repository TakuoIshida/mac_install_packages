import * as dotenv from "dotenv";
dotenv.config();

const REPO = "edash-product/e-dash-app";
const USER = "TakuoIshida";
const START = "2024-10-01";
const END = "2025-03-31";
const PER_PAGE = 100;

const GITHUB_TOKEN = process.env.GITHUB_TOKEN;
if (!GITHUB_TOKEN) {
  throw new Error("GITHUB_TOKEN is not set in .env");
}


async function fetchReviewedPRs(page = 1): Promise<{ number: number; title: string }[]> {
  const query = `repo:${REPO} type:pr reviewed-by:${USER} merged:${START}..${END}`;
  const url = `https://api.github.com/search/issues?q=${encodeURIComponent(query)}&per_page=${PER_PAGE}&page=${page}`;

  const res = await fetch(url, {
    headers: {
      Authorization: `Bearer ${GITHUB_TOKEN}`,
      Accept: "application/vnd.github+json",
    },
  });

  if (!res.ok) {
    const errorText = await res.text();
    throw new Error(`GitHub API error: ${res.status} ${res.statusText}\n${errorText}`);
  }

  const data = await res.json();
  return data.items || [];
}

async function main() {
  console.log(`Fetching PRs reviewed by ${USER} from ${START} to ${END}...`);

  const allPRs: { number: number; title: string }[] = [];
  let page = 1;

  while (true) {
    const prs = await fetchReviewedPRs(page);
    if (prs.length === 0) break;
    allPRs.push(...prs);
    if (prs.length < PER_PAGE) break;
    page++;
  }

  console.log(`\n${USER} reviewed ${allPRs.length} PRs:`);
  for (const pr of allPRs) {
    console.log(`- #${pr.number} ${pr.title}`);
  }
}

main().catch(err => {
  console.error("Error:", err);
  process.exit(1);
});
