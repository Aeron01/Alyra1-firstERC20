const { expect } = require('chai');
const { ethers } = require('hardhat');

describe('LapinCretin Token', async function () {
  let dev, owner, LapinCretin, lapincretin;
  const NAME = 'LapinCretin';
  const SYMBOL = 'LAC';
  const INITIAL_SUPPLY = ethers.utils.parseEther('1000000');
  beforeEach(async function () {
    [dev, owner] = await ethers.getSigners();
    LapinCretin = await ethers.getContractFactory('LapinCretin');
    lapincretin = await LapinCretin.connect(dev).deploy(owner.address, INITIAL_SUPPLY);
    await lapincretin.deployed();
  });

  it(`doit avoir le nom ${NAME}`, async function () {
    expect(await lapincretin.name()).to.equal(NAME);
  });

  it(`doit avoir le symbol ${SYMBOL}`, async function () {
    expect(await lapincretin.symbol()).to.equal(SYMBOL);
  });

  it(`doit avoir un total de départ ${INITIAL_SUPPLY}`, async function () {
    expect(await lapincretin.totalSupply()).to.equal(INITIAL_SUPPLY);
  });

  it(`doit mint le depot initial ${INITIAL_SUPPLY.toString()} de l'owner`, async function () {
    expect(await lapincretin.balanceOf(owner.address)).to.equal(INITIAL_SUPPLY);
  });
});
