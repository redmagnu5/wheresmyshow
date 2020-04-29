echo "installing packages \n"

npm install
npm install client

echo "starting dev server"

npm run --prefix client serve
