/**
 * @type import('hardhat/config').HardhatUserConfig
 */

require('@nomiclabs/hardhat-ethers');
require('@openzeppelin/hardhat-upgrades');

module.exports = {
	defaultNetwork: 'ganache',
	networks: {
		ganache: {
			url: 'HTTP://127.0.0.1:7545',
			accounts: [
				'8f071301d9def7045b29de590a9a63ea2363068bc9bd083b4e8ee764b469ffa8',
				'02a251ade65e2c67f7f4b137ef0400c82d54e578af9b4ca1020ba7750afc8f57',
				'bbe7502952fcda4facdd20acaf2b7a4055a1aa146ba53a1c70eb187e40e8fbda',
				'5c2e02fb15b0b581128a386c240ef4ecffb6a4ce3f0d469f162533b784b10362',
				'd839b65200ae0e07cf585767de1071fbdefe5500b1ff3ea2abf674712b6eaf08',
			],
		},
	},
	solidity: {
		version: '0.8.0',
	},
};
