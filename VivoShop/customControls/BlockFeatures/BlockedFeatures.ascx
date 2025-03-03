<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BlockedFeatures.ascx.cs" Inherits="VivoShop.customControls.BlockFeatures.BlockedFeatures" %>
<div class="block block-features block-features--layout--classic" style="margin-top:0;margin-bottom:0">
    <div class="container-fluid">
        <div class="block-features__list">
            <div class="block-features__item">
                <div class="block-features__icon">
                    <svg width="48px" height="48px">
                        <use xlink:href="/images/sprite.svg#fi-free-delivery-48"></use>
                    </svg>
                </div>
                <div class="block-features__content">
                    <div class="block-features__title">Besplatna dostava</div>
                    <div class="block-features__subtitle">Za iznose preko <asp:Label ID="lblFreeDeliveryTotalValue" runat="server">5.000,00</asp:Label></div>
                </div>
            </div>
            <div class="block-features__divider"></div>
            <div class="block-features__item">
                <div class="block-features__icon">
                    <svg width="48px" height="48px">
                        <use xlink:href="/images/sprite.svg#fi-24-hours-48"></use>
                    </svg>
                </div>
                <div class="block-features__content">
                    <div class="block-features__title">Podrška i pomoć</div>
                    <div class="block-features__subtitle">Pozovite nas u bilo koje vreme</div>
                </div>
            </div>
            <div class="block-features__divider"></div>
            <div class="block-features__item">
                <div class="block-features__icon">
                    <svg width="48px" height="48px">
                        <use xlink:href="/images/sprite.svg#fi-payment-security-48"></use>
                    </svg>
                </div>
                <div class="block-features__content">
                    <div class="block-features__title">100% Sigurna kupovina</div>
                    <div class="block-features__subtitle">Proverene transakcije</div>
                </div>
            </div>
            <div class="block-features__divider"></div>
            <div class="block-features__item">
                <div class="block-features__icon">
                    <svg width="48px" height="48px">
                        <use xlink:href="/images/sprite.svg#fi-tag-48"></use>
                    </svg>
                </div>
                <div class="block-features__content">
                    <div class="block-features__title">Velike akcije</div>
                    <div class="block-features__subtitle">Popusti i do 90%</div>
                </div>
            </div>
        </div>
    </div>
</div>
