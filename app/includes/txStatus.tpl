<main class="tab-pane block--container active" ng-if="globalService.currentTab==globalService.tabs.txStatus.id" ng-controller='txStatusCtrl' role="main" ng-cloak>

  <!-- Section 1 -->
  <section class="block txstatus__1">
    <article class="row">
      <section class="col-xs-12 col-md-7">
        <h1 translate="NAV_CheckTxStatus" class="h1 title checktx-title">
          Check TX Status
        </h1>
        <p translate="tx_Summary" class="text-left text-muted checktx-description"></p>
      </section>

      <section class="col-xs-12 col-md-6">
          <input
             class="form-control"
             type="text"
             placeholder="0x3f0efedfe0a0cd611f2465fac9a3699f92d6a06613bc3ead4f786856f5c73e9c"
             ng-model="txInfo.hash"
             ng-keyup="$event.keyCode == 13 && checkTxStatus()"
             aria-label="{{'x_TxHash' | translate}}" ng-class="Validator.isValidTxHash(txInfo.hash) ? 'is-valid' : 'is-invalid'"/>
          <button tabindex="0"
                  role="button"
                  class="btn btn-primary"
                  ng-click="checkTxStatus()"
                  translate="NAV_CheckTxStatus"> Check TX Status </button>
      </section>
    </article>
  </section>
  <!-- / Section 1 -->


  <!-- Section 2: Current State -->
  <section class="block txstatus__2" ng-show="txInfo.status==txStatus.mined || txInfo.status==txStatus.notFound || txInfo.status==txStatus.found">

    <div class="txblock" ng-show="txInfo.status == txStatus.mined">
      <h3 class="text-success" translate="tx_FoundOnChain" class="txblock__title"> Transaction Found </h3>
      <h5> <a href="https://etherscan.io/tx/{{ tx.hash }}" target="_blank" rel="noopener noreferrer"> {{ tx.hash }} </a> </h5>
      <p class="text-left"><span translate="tx_FoundOnChain_1"></span></p>
      <ul class="tx-status-text text-muted">
        <li translate="tx_FoundOnChain_2"></li>
        <li translate="tx_FoundOnChain_3"></li>
      </ul>
    </div>

    <div class="txblock" ng-show="txInfo.status == txStatus.notFound">
      <h3 class="text-danger txblock__title" translate="tx_notFound">
        Transaction Not Found
      </h3>
      <p class="text-left">
        <span translate="tx_notFound_1"></span>
      </p>
      <ul class="tx-status-text text-muted">
        <li translate="tx_notFound_2"></li>
        <li translate="tx_notFound_3"></li>
        <li translate="tx_notFound_4"></li>
      </ul>
    </div>

    <div class="txblock" ng-show="txInfo.status == txStatus.found">
      <h3 class="text-warning txblock__title" translate="tx_foundInPending">
        Pending Transaction Found
      </h3>
      <ul>
        <li translate="tx_foundInPending_1"></li>
        <li translate="tx_foundInPending_2"></li>
        <li translate="tx_foundInPending_3"></li>
      </ul>
    </div>

    <!-- <div ng-show="txInfo.status == txStatus.found || txInfo.status == txStatus.mined"> -->
    <div class="txblock">
      <h4 translate="tx_Details" class="txblock__title">
        Transaction Details
      </h4>
      <div class="table">
      		<div class="table-row">
      			<div class="table-row__qes">
      				
      			</div>

      			<div class="table-row__name">
      				TX Hash
      			</div>
      				
      			<div class="table-row__number">
      				<p class="table-row__number__color break"><a href="{{ txInfo.txExplorerUrl }}" target="_blank" rel="noopener noreferrer">
                {{ txInfo.hash }}
              </a></p>
      			</div>
      		</div>

      		<div class="table-row">
      			<div class="table-row__qes">
      				
      			</div>

      			<div class="table-row__name">
      				From Address
      			</div>
      				
      			<div class="table-row__number">
      				<p class="table-row__number__color break"> <a href="{{ txInfo.fromExplorerUrl }}" target="_blank" rel="noopener noreferrer">
                {{ txInfo.from }}
              </a></p>
      			</div>
      		</div>

      		<div class="table-row">
      			<div class="table-row__qes">
      				
      			</div>

      			<div class="table-row__name">
      				To Address
      			</div>
      				
      			<div class="table-row__number">
      				<p class="table-row__number__color break"><a href="{{ txInfo.toExplorerUrl }}" target="_blank" rel="noopener noreferrer">
                {{ txInfo.to }}
              </a></p>
      			</div>
      		</div>

      		<div class="table-row">
      			<div class="table-row__qes">
      				
      			</div>

      			<div class="table-row__name">
      				Amount
      			</div>
      				
      			<div class="table-row__number">
      				<p> {{ txInfo.valueStr }}</p>
      			</div>
      		</div>

      		<div class="table-row">
      			<div class="table-row__qes">
      				
      			</div>

      			<div class="table-row__name">
	      			<a class="account-help-icon"
	                 href="https://kb.myetherwallet.com/transactions/what-is-nonce.html"
	                 target="_blank"
	                 rel="noopener noreferrer">
	                   <img src="images/help.png" class="help-icon" />
	                  <p class="account-help-text" translate="NONCE_Desc"></p>
	              </a>
      				Nonce
      			</div>
      				
      			<div class="table-row__number">
      				<p>{{ txInfo.nonce }}</p>
      			</div>
      		</div>

      		<div class="table-row">
      			<div class="table-row__name">
      			<a class="account-help-icon"
                 href="https://kb.myetherwallet.com/gas/what-is-gas-ethereum.html"
                 target="_blank"
                 rel="noopener noreferrer">
                    <img src="images/help.png" class="help-icon" />
                    <p class="account-help-text" translate="GAS_LIMIT_Desc"></p>
              </a>
      				Gas Limit
      			</div>
      				
      			<div class="table-row__number">
      				<p>{{ txInfo.gasLimit }}</p>
      			</div>
      		</div>

      		<div class="table-row">
      			<div class="table-row__name">
      			<a class="account-help-icon"
                 href="https://kb.myetherwallet.com/gas/what-is-gas-ethereum.html"
                 target="_blank"
                 rel="noopener noreferrer">
                   <img src="images/help.png" class="help-icon" />
                   <p class="account-help-text" translate="GAS_PRICE_Desc"></p>
              </a>
      				Gas Price
      			</div>
      				
      			<div class="table-row__number">
      				<p>{{ txInfo.gasPrice.gwei }} GWEI
              <small>
                ({{ txInfo.gasPrice.wei }} WEI)
              </small></p>
      			</div>
      		</div>

      		<div class="table-row">
      			<div class="table-row__name">
      				Data
      			</div>
      				
      			<div class="table-row__number break">
      				<p>{{ txInfo.data }}</p>
      			</div>
      		</div>

      		
      	</div>
    </div>
  </section>
  <!-- / Section 2: Current State -->


  <!-- Section 3:  Unlock -->
  <!-- <section class="txstatus__3" ng-show="txInfo.status == txStatus.found"> -->
  <section class="txstatus__3" >

    <br><br>
<!-- 
    <h1 class="text-center" translate="x_CancelReplaceTx">
      Cancel or Replace Transaction
    </h1>
 -->
  </section>
  <!-- / Section 3:  Unlock -->

  <!-- Send Tx Content -->
 <section class="row" ng-show="wallet!=null" ng-controller='sendTxCtrl'>
    <div ng-show="wallet.getChecksumAddressString() == txInfo.from">
      @@if (site === 'mew' ) { @@include( './sendTx-content.tpl', { "site": "mew" } ) }
      @@if (site === 'cx'  ) { @@include( './sendTx-content.tpl', { "site": "cx"  } ) }

      @@if (site === 'mew' ) { @@include( './sendTx-modal.tpl',   { "site": "mew" } ) }
      @@if (site === 'cx'  ) { @@include( './sendTx-modal.tpl',   { "site": "cx"  } ) }
    </div>
    <div class="col-xs-12 block block--danger" ng-show="wallet.getChecksumAddressString()!=txInfo.from">
      <h5 translate="ENS_WrongAddress_2">
        Please unlock the wallet with address
      </h5>
      {{ txInfo.from }}
    </div>
  </section>
