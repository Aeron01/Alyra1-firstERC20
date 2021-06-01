const { expect } = require('chai');
const { ethers } = require('hardhat');

describe('Lahar Token', async function () {
  let dev, owner, Lahar, lahar;
  const NAME = 'Lahar';
  const SYMBOL = 'LAH';
  const INITIAL_SUPPLY = ethers.utils.parseEther('1000000');
  beforeEach(async function () {
    [dev, owner] = await ethers.getSigners();
    Lahar = await ethers.getContractFactory('Lahar');
    lahar = await Lahar.connect(dev).deploy(owner.address, INITIAL_SUPPLY);
    await lahar.deployed();
  });

  it(`doit avoir le nom ${NAME}`, async function () {
    expect(await lahar.name()).to.equal(NAME);
  });

  it(`doit avoir le symbol ${SYMBOL}`, async function () {
    expect(await lahar.symbol()).to.equal(SYMBOL);
  });

  it(`doit avoir un total de départ ${INITIAL_SUPPLY}`, async function () {
    expect(await lahar.totalSupply()).to.equal(INITIAL_SUPPLY);
  });

  it(`doit mint le depot initial ${INITIAL_SUPPLY.toString()} de l'owner`, async function () {
    expect(await lahar.balanceOf(owner.address)).to.equal(INITIAL_SUPPLY);
  });
});
