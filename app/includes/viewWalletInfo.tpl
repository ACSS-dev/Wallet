<main class="tab-pane active" ng-if="globalService.currentTab==globalService.tabs.viewWalletInfo.id" ng-controller='viewWalletCtrl' ng-cloak>

  <article class="collapse-container" style="background: #fff">
  	<div class="block" style="box-shadow: initial;">
		<h1 class="h1 title" style="text-transform: uppercase; margin-bottom: 20px !important; ">View Wallet Info</h1>
		<p class="text-left">This allows you to download different versions of private keys and re-print your paper wallet. You may want to do this in order to <a target="_blank" rel="noopener noreferrer" href="http://ethereum.stackexchange.com/questions/465/how-to-import-a-plain-private-key-into-geth/">import your account into Geth/Mist</a>. If you want to check your balance, we recommend using a blockchain explorer like <a target="_blank" rel="noopener noreferrer" href="https://etherscan.io/">etherscan.io</a>.</p>
	</div>
    <div ng-show="!wd">
      <wallet-decrypt-drtv></wallet-decrypt-drtv>
    </div>

  </article>

  <article class="row" ng-show="wallet!=null">

	@@include( './viewWalletInfo-content.tpl', { "site": "mew" } )

  </article>

</main>
