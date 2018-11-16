<article class="row block">

  <div class="">
    <h1 class="h1 title" translate="OFFLINE_Step3_Title">
      Step 3: Send / Publish Transaction
    </h1>
  </div>

  <div class="">
    <p translate="OFFLINE_Step3_Label_1" class="text-left">
      Paste the signed transaction from Step 2
    </p>
    <label translate="SEND_signed">
      Signed Transaction
    </label>
    <textarea class="form-control" rows="7" ng-model="signedTx"></textarea>
    <a class="btn btn-primary" ng-click="confirmSendTx()" translate="SEND_trans">
      SEND TRANSACTION
    </a>
  </div>

</article>
