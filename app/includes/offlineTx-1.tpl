<!-- Step 1 -->
<article class="row block">

  <h1 class="h1 clearfix title" translate="OFFLLINE_Step1_Title">Step 1: Generate Information (Online Computer)</h1>

  <!-- From Address Input -->
  <section class="clearfix">

    <div class="account-help-icon">
    	<img src="images/help.png" class="help-icon" />
      <p class="account-help-text" translate="OFFLINE_Step1_Label_2">
        Note: This is the FROM address, not the TO address.
      </p>
      <label translate="OFFLINE_Step1_Label_1">
        From Address:
      </label>
    </div>

    <input class="form-control"
           type="text"
           placeholder="0xDECAF9CD2367cdbb726E904cD6397eDFcAe6068D"
           ng-model="tx.from"
           ng-change="validateAddress(tx.from,'')"
           ng-class="Validator.isValidAddress(tx.from) ? 'is-valid' : 'is-invalid'" />

  </section>

  <!-- Button -->
  <section class="clearfix">
    <a class="btn btn-info" ng-click="getWalletInfo()" translate="OFFLINE_Step1_Button">
      GENERATE INFORMATION
    </a>
  </section>


  <section class="clearfix" ng-show="showWalletInfo">

    <!-- Gas Price -->
    <div class="col-xs-6 col-sm-5">
      <label translate="OFFLINE_Step2_Label_3">
        Gas Price
      </label>
      <input class="form-control" type="text" placeholder="" readonly="readonly" ng-model="gasPriceDec"/>
    </div>

    <!-- Nonce -->
    <div class="col-xs-6 col-sm-5">
      <label translate="OFFLINE_Step2_Label_5">
        Nonce
      </label>
      <input class="form-control" type="text" placeholder="" readonly="readonly" ng-model="nonceDec"/>
    </div>

  </section>

</article>
<!-- / Step 1 -->
