#!bin/bash
curl https://get.volta.sh | bash
volta -v

# node
volta install node
node -v

# npm
volta install npm
volta install pnpm
npm -v
pnpm -v

# 特定のversionの場合
# volta install node@14.15.5

# volta でプロジェクトのnode, npmを固定したい
# volta pin node@18.x.x
# volta pin npm@18.x.x
# "volta": {
#     "node": "20.10.0",
#     "npm": "10.2.3"
#   }