const VANRY = artifacts.require("VANRY");

module.exports = async function(deployer){

  await deployer.deploy(VANRY,"initial supply address here");
  const VANRYContract = await VANRY.deployed();

  console.log('\n*************************************************************************\n')
  console.log(`VANRY Contract Address: ${VANRYContract.address}`)
  console.log('\n*************************************************************************\n')
  
}




