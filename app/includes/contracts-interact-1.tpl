
<!-- Address -->
<section class="col-sm-6 clearfix m-0 contract-address">
  <div class="row">
    <address-field labeltranslated="CONTRACT_Title" var-name="contract.address"></address-field>
  </div>
</section>

<!-- Select Contract Dropdown -->
<section class="col-sm-6 clearfix p-0 contract-address">
  <label translate="CONTRACT_Title_2">
    Select Existing Contract
  </label>

  <div class="dropdown">

    <a class="btn btn-default dropdown-toggle"
       class="dropdown-toggle"
       style="width: 100%; max-width: initial;" 
       ng-click="dropdownExistingContracts = !dropdownExistingContracts">
        {{selectedAbi.name}}
        <small class="mono">{{selectedAbi.address}}</small>
        <i class="caret"></i>
    </a>

    <ul class="dropdown-menu dropdown-menu-left" ng-show="dropdownExistingContracts">
      <li ng-repeat="abi in ajaxReq.abiList track by $index" class="dropdown-menu__item">
        <a ng-click="selectExistingAbi($index)" class="dropdown-menu__link">
          {{abi.name}}
          <small class="mono">{{abi.address}}</small>
        </a>
      </li>
    </ul>
  </div>
</section>

<!-- ABI Textarea -->
<section class="clearfix">
  <label translate="CONTRACT_Json">
    ABI / JSON Interface
  </label>
  <textarea class="form-control"
            rows="6"
            placeholder='[{ "type":"contructor", "inputs": [{ "name":"param1", "type":"uint256", "indexed":true }], "name":"Event" }, { "type":"function", "inputs": [{"name":"a", "type":"uint256"}], "name":"foo", "outputs": [] }] '
            ng-class="Validator.isJSON(contract.abi) ? 'is-valid' : 'is-invalid'"
            ng-model="contract.abi"></textarea>
</section>

<!-- Button -->
<section class="clearfix">
  <button class="btn btn-primary" ng-click="initContract()" translate="x_Access"> ACCESS </button>
</section>
