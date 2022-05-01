# web3oj-sol

이 프로젝트는 [web3oj](https://app.web3oj.com/)의 문제를 풀수 있는 [hardhat](https://hardhat.org/)기반 개발환경을 제공합니다.

## 설정

### node version
- [hardhat](https://hardhat.org/tutorial/setting-up-the-environment.html)에서 노드 버전은 >= 12.0 을 지원하지만, 16 버전을 추천드립니다.


### 패키지 설치
```shell
$ npm install
```

### `hardhat.config.js` 에 `rinkeby` 네트워크와 Account 설정

```js
// hardhat.config.js
...
module.exports = {
  solidity: "0.8.4",
  networks: {
    // rinkeby
    rinkeby: {
      url: process.env.RINKEBY_URL || "https://rinkeby.infura.io/v3/...",
      accounts:
        process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY] : [],
    },
  },
  gasReporter: {
    enabled: process.env.REPORT_GAS !== undefined,
    currency: "USD",
  },
  etherscan: {
    apiKey: process.env.ETHERSCAN_API_KEY,
  },
};
```

- [INFURA](https://infura.io/)에 회원가입하고 프로젝트를 생성하여 Rinkeby API KEY를 받으세요
- 루트에 .env 파일을 생성하여 아래와 같이 넣으면 RINKEBY_URL, PRIVATE_KEY 를 설정할수 있습니다

```
RINKEBY_URL=https://rinkeby.infura.io/v3/<YOUR INFURA KEY>
PRIVATE_KEY=<YOUR PRIVATEKEY KEY>
```

### IDE 설정

#### VSCode

- [solidity](https://marketplace.visualstudio.com/items?itemName=JuanBlanco.solidity)
  - `.sol` 파일을 위한 extension

#### IntelliJ

- [Solidity](https://plugins.jetbrains.com/plugin/9475-solidity)
  - `.sol` 파일을 위한 extension

## 예제 덧셈 문제풀기

1. 문제 > 덧셈 > 문제풀기 클릭하세요.

2. 문제 영역을 복사하여 contracts/PlusCalculatorProblem.sol 로 저장, Sample 영역을 복사하여 contracts/MyPlusCalculator.sol 로 저장하세요.

3. MyPlusCalculator.sol에 plus함수를 완성 시킨뒤 실행시켜주세요.

4. scripts/plusCalculatorSol.js 를 생성 및 실행하세요.

   생성

   ```js
   // scripts/plusCalculatorSol.js
   const { ethers } = require("hardhat");
   const hre = require("hardhat");

   async function calculatorSol() {
     const [myAccount] = await ethers.getSigners();

     const MyPlusCalculator = await ethers.getContractFactory(
       "MyPlusCalculator"
     );
     const myPlusCalculator = await MyPlusCalculator.connect(
       myAccount
     ).deploy();
     await myPlusCalculator.deployed();

     const instance = "0x000...000"; // 이곳에 덧셈 문제 인스턴스 컨트랙트 주소를 넣으세요
     const PlusCalculatorProblem = await ethers.getContractFactory(
       "PlusCalculatorProblem"
     );
     const plusCalculatorProblem = PlusCalculatorProblem.attach(instance);
     plusCalculatorProblem
       .connect(myAccount)
       .setPlusCalculator(myPlusCalculator.address);
   }

   async function main() {
     calculatorSol();
   }

   main().catch((error) => {
     console.error(error);
     process.exitCode = 1;
   });
   ```

   실행

   ```
   $ npx hardhat --network rinkeby run scripts/plusCalculatorSol.js
   ```

5. 제출하기 클릭으로 문제풀이를 마무리하세요.
