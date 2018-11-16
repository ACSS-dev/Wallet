<main class="tab-pane block--container active"
      ng-if="globalService.currentTab==globalService.tabs.generateWallet.id"
      ng-controller='walletGenCtrl'
      role="main"
      ng-cloak>

  <article class="block__wrap" ng-show="!wallet && !showGetAddress">
<div class="standart-block">
	<div class="two-cols">
		<div class="two-cols__ferst-col">
			<h1 class="h1 title" style="text-transform: uppercase;" translate="NAV_GenerateWallet" aria-live="polite">
			CREATE NEW WALLET
			</h1>
			<h2 translate="GEN_Label_1">
			Enter a password
			</h2>
			<div class="input-group input-group_pass">
		        <input name="password"
		             class="form-control"
		             type="{{showPass && 'password' || 'text'}}"
		             placeholder="{{'GEN_Placeholder_1' | translate }}"
		             ng-model="password"
		             ng-class="isStrongPass() ? 'is-valid' : 'is-invalid'"
		             aria-label="{{'GEN_Label_1' | translate}}"
		             />
		        <span tabindex="0"
		              aria-label="make password visible"
		              role="button"
		              class="input-group-addon btn eye btn-eye-contact"
		              ng-class="showPass ? 'btn-eye-contact_view' : 'btn-eye-contact_hide'"
		              ng-click="showPass=!showPass">
		              <img src="images/eye.svg">
		        </span>
		      </div>
		      <a tabindex="0"
		         role="button"
		         class="btn btn-primary"
		         style="margin-top: 20px;" 
		         ng-click="genNewWallet()"
		         translate="NAV_GenerateWallet">
		           Generate Wallet
		      </a>
			<div class="two-cols__ferst-col__info">
				<p>This password encrypts your private key. This does not act as a seed to generate your keys. <strong>You will need this password + your private key to unlock your wallet.</strong> </p>
				<style>
					.two-cols__ferst-col__info .point li{
							line-height: 1.3;
							
						}
					.two-cols__ferst-col__info .point a{
								color: #0D0D0D !important;
								font-weight: bold !important;
								font-size: 17px;
							}
				</style>
				<ul class="point ul-help">
					<li><a href="https://kb.myetherwallet.com/getting-started/creating-a-new-wallet-on-myetherwallet.html"
				          target="_blank"
				          rel="noopener noreferrer"
				          translate="GEN_Help_5">How to Create a Wallet</a></li>
					<li><a href="https://kb.myetherwallet.com/getting-started/getting-started-new.html"
			               target="_blank"
			               rel="noopener noreferrer"
			               translate="GEN_Help_6">Getting Started</a></li>
				</ul>
			</div>
		</div>
		<div class="two-cols__second-col">
			<div class="two-cols__second-col__line">
				<img src="images/line.svg">
			</div>
			<div class="two-cols__second-col__info">
				<h3 translate="GEN_Help_0">Already have a wallet somewhere?</h3>
				<ul class="point">
					<li class="two-cols__second-col__info__text">Ledger / TREZOR / Digital Bitbox / Secalot : Use <span translate="GEN_Help_1"> your </span> <a ng-click="globalService.currentTab=globalService.tabs.sendTransaction.id">hardware wallet</a> . <span translate="GEN_Help_3">Your device is your wallet.</span></li>
					<li class="two-cols__second-col__info__text">MetaMask Connect via your <a ng-click="globalService.currentTab=globalService.tabs.sendTransaction.id">MetaMask Extension</a> . <span translate="GEN_Help_MetaMask">So easy! Keys stay in MetaMask, not on a phishing site! Try it today.</span></li>
					<li class="two-cols__second-col__info__text">Jaxx / imToken <span translate="GEN_Help_1"> Use your </span> Mnemonic Phrase to access your account.</li>
					<li class="two-cols__second-col__info__text">Mist / Geth / Parity: Use your <a ng-click="globalService.currentTab=globalService.tabs.sendTransaction.id" translate="x_Keystore2">Keystore File (UTC / JSON) </a> to access your account.</li>
				</ul>
			</div>
		</div>
	</div>

 </div>
  </article>


  <article role="main" class="block__wrap gen__2" ng-show="wallet && !showPaperWallet" >
<div class="standart-block">
	<div class="two-cols">
		<div class="two-cols__ferst-col">
			<h1 translate="GEN_Label_2" class="heding-1-setting-for-mobile heding-1-setting-for-desctop h1">
			Save your Keystore File
			</h1>
			
			<a tabindex="0" role="button"
		         class="btn btn-primary"
		         href="{{blobEnc}}"
		         download="{{encFileName}}"
		         aria-label="{{'x_Download'|translate}} {{'x_Keystore'|translate}}"
		         aria-describedby="x_KeystoreDesc"
		         ng-click="downloaded()"
		         style="font-size: 17px; max-width: initial; margin-bottom: 20px;" 
		         rel="noopener noreferrer">
		        <span translate="x_Download">
		          DOWNLOAD
		        </span>
		        <span translate="x_Keystore2">
		          Keystore File
		        </span>
		      </a>
			
			<div class="two-cols__ferst-col__warning ">
				<div class="warn" style="margin-bottom: 40px;">
			        <p class="GEN_Warning_1 text-muted">
			          <strong>**Do not lose it!**</strong> It cannot be recovered if you lose it.
			        </p>
			        <p class="GEN_Warning_2 text-muted">
			          <strong>**Do not share it!**</strong> Your funds will be stolen if you use this file on a malicious/phishing site.
			        </p>
			        <p class="GEN_Warning_3 text-muted">
			          <strong>**Make a backup!**</strong> Secure it like the millions of dollars it may one day be worth.
			        </p>
			      </div>
				<!-- класс кнопки не феолетовой -->
				<p>
		        <a tabindex="0"
		           role="button"
		           class="btn-pink"
		           ng-class="fileDownloaded ? '' : 'disabled' "
		           ng-click="continueToPaper()">
		            <span translate="GET_ConfButton">
		              I understand. Continue.
		            </span>
		        </a>
		      </p>
			</div>
		</div>
		<style>
			.two-cols__second-col__info__inp{
				border: 1px solid red;
			    border-image: linear-gradient(to bottom, #F76C1C 0%, #FAD860 100%);
			    width: 100%;
			    font-size: 13px;
			    border-image-slice: 1;
			    padding: 5px;
			}
			.two-cols__second-col{
				max-width: 280px;
			}
			.point, .two-cols__second-col__info h3{
				margin-left: 45px;
			}
		</style>
		<div class="two-cols__second-col">
			<!-- не забыть задать значения для компа, на болку ничего задавать не нужно -->
			<div class="two-cols__second-col__line">
				<img src="images/line.svg">
			</div>
			<div class="two-cols__second-col__info">
				<h3 style="font-size: 19px; padding-right: 10%; margin-bottom: 5px;">Not Downloading a File?</h3>
				<ul class="point">
					<li class="two-cols__second-col__info__text">Try using Google Chrome</li>
					<li class="two-cols__second-col__info__text">Right click & save file as. Filename:</li>
					<input type="text" name="" class="two-cols__second-col__info__inp" placeholder="UTC--2018-10-09T17-09-56.981Z--c03">
				</ul>
				<h3 style="font-size: 19px; padding-right: 10%; margin-bottom: 5px;">Don't open this file on your computer</h3>
				<ul class="point">
					<li class="two-cols__second-col__info__text">Use it to unlock your wallet via MyEtherWallet
					(or Mist, Geth, Parity and other wallet clients.)</li>
				</ul>
				<h3 style="font-size: 19px; padding-right: 10%; margin-bottom: 5px;">Guides & FAQ</h3>
				<ul class="point">
					<li class="two-cols__second-col__info__text">
						<a href="https://kb.myetherwallet.com/getting-started/backing-up-your-new-wallet.html" target="_blank" rel="noopener noreferrer">
				            <strong translate="GEN_Help_13">
				              How to Back Up Your Keystore File
				            </strong>
				          </a>
					</li>
					<li class="two-cols__second-col__info__text">
						<a href="https://kb.myetherwallet.com/private-keys-passwords/difference-beween-private-key-and-keystore-file.html" target="_blank" rel="noopener noreferrer">
				            <strong translate="GEN_Help_14">
				              What are these Different Formats?
				            </strong>
				          </a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
  </article>


  <article role="main" class="block__wrap gen__3" ng-show="showPaperWallet">
		<div class="standart-block">
			<div class="two-cols">
				<div class="two-cols__ferst-col">
					<h1 class="heding-1-setting-for-mobile heding-1-setting-for-desctop h1">
					Save Your Private Key
					</h1>
					<div class="two-cols__pass-inp">
					<textarea aria-label="{{'x_PrivKey'|translate}}"
				             aria-describedby="{{'x_PrivKeyDesc'|translate}}"
				             class="inp contact-adress-inp form-control"
				             readonly="readonly"
				             style="height: 47px; line-height: 37px; resize: none; background: #fff; " 
				             rows="3"
				      >{{wallet.getPrivateKeyString()}}</textarea>
				    </div>
					<a tabindex="0"
				         aria-label="{{'x_Print'|translate}}"
				         aria-describedby="x_PrintDesc"
				         role="button"
				         class="btn"
				         style="margin-bottom: 20px; font-size: 17px; " 
				         ng-click="printQRCode()"
				         translate="x_Print">
				          PRINT
				      </a>
					
					<div class="two-cols__ferst-col__warning">
						<div class="" style="margin-bottom: 40px">
						<p class="text-muted" style="margin-bottom: 15px;"><strong>**Do not lose it!**</strong> It cannot be recovered if you lose it.</p>
						<p class="text-muted" style="margin-bottom: 15px;"><strong>**Do not share it!**</strong> Your funds will be stolen if you use this file on a malicious/phishing site.</p>
						<p class="text-muted" style="margin-bottom: 15px;"><strong>**Make a backup!**</strong> Secure it like the millions of dollars it may one day be worth.</p>
						</div>
						<a class="btn-pink" ng-click="getAddress()">
					        Save your Address
					      </a>
						<!-- класс кнопки не феолетовой -->
					</div>
				</div>
				<style>
					.two-cols__second-col__info__p{
						margin-left: 44px;
						margin-top: 60px;
					}
				</style>
				<div class="two-cols__second-col">
					<!-- не забыть задать значения для компа, на болку ничего задавать не нужно -->
					<div class="two-cols__second-col__line">
						<img src="images/line.svg">
					</div>
					<div class="two-cols__second-col__info">
						<h3 style="font-size: 19px; padding-right: 10%; margin-bottom: 5px;">Guides & FAQ</h3>
						<ul class="point">
							<li class="two-cols__second-col__info__text">
								<a href="https://kb.myetherwallet.com/getting-started/backing-up-your-new-wallet.html" target="_blank" rel="noopener noreferrer">
						          <strong translate="HELP_2a_Title">
						            How to Save & Backup My Wallet?
						          </strong>
						        </a>
	    					</li>
							<li class="two-cols__second-col__info__text">
								<a href="https://kb.myetherwallet.com/getting-started/protecting-yourself-and-your-funds.html" target="_blank" rel="noopener noreferrer">
						          <strong translate="GEN_Help_15">Preventing loss &amp; theft of your funds.</strong>
						        </a>
							</li>
						</ul>
						<h3 style="font-size: 19px; padding-right: 10%; margin-top: 5px; margin-bottom: 5px;">Why Should I?</h3>
						<ul class="point">
							<li class="two-cols__second-col__info__text"><a href="">To have a secondary backup.</a></li>
							<li class="two-cols__second-col__info__text"><a href="">In case you ever forget your password.</a></li>
							<li class="two-cols__second-col__info__text">
								 <a href="https://kb.myetherwallet.com/offline/ethereum-cold-storage-with-myetherwallet.html" target="_blank" rel="noopener noreferrer" translate="GEN_Help_20">Cold Storage</a>
							</li>
						</ul>
						<p class="two-cols__second-col__info__p">ProTip: If you cannot print this right now, click "Print" and save it as a PDF until you are able to get it printed. Remove it from your computer afterwards!</p>
					</div>
					
				</div>
			</div>
			
		</div>
  </article>

  <article class="text-left" ng-show="showGetAddress">
    <div class="clearfix collapse-container">

      <!-- <div ng-click="wd = !wd">
        <a class="collapse-button"><span ng-show="wd">+</span><span ng-show="!wd">-</span></a>
        <h1 traslate="GEN_Unlock">Unlock your wallet to see your address</h1>
        <p translate="x_AddessDesc"></p>
      </div> -->

      <div ng-show="!wd">
           <wallet-decrypt-drtv></wallet-decrypt-drtv>
          <!-- @@if (site === 'cx' )  {  <cx-wallet-decrypt-drtv></cx-wallet-decrypt-drtv>   } -->
      </div>
    </div>

    <div class="row" ng-show="wallet!=null" ng-controller='viewWalletCtrl'>
		@@include( './viewWalletInfo-content.tpl', { "site": "mew" } ) 
    </div>

  </article>
</main>
