const { expect } = require('chai');
const { ethers } = require('hardhat');

describe('Coincoin Token', async function () {
  let dev, owner, Coincoin, coincoin;
  const NAME = 'Coincoin';
  const SYMBOL = 'COIN';
  const INITIAL_SUPPLY = ethers.utils.parseEther('1000000');
  beforeEach(async function () {
    [dev, owner] = await ethers.getSigners();
    Coincoin = await ethers.getContractFactory('Coincoin');
    coincoin = await Coincoin.connect(dev).deploy(owner.address, INITIAL_SUPPLY);
    await coincoin.deployed();
  });

  it(`doit avoir le nom ${NAME}`, async function () {
    expect(await coincoin.name()).to.equal(NAME);
  });

  it(`doit avoir le symbol ${SYMBOL}`, async function () {
    expect(await coincoin.symbol()).to.equal(SYMBOL);
  });

  it(`doit avoir un total de départ ${INITIAL_SUPPLY}`, async function () {
    expect(await coincoin.totalSupply()).to.equal(INITIAL_SUPPLY);
  });

  it(`doit mint le depot initial ${INITIAL_SUPPLY.toString()} de l'owner`, async function () {
    expect(await coincoin.balanceOf(owner.address)).to.equal(INITIAL_SUPPLY);
  });
});
