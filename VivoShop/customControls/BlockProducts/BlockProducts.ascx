<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BlockProducts.ascx.cs" Inherits="VivoShop.customControls.BlockProducts.BlockProducts" %>
<%@ Register Src="~/customControls/ProductControls/FeaturedProduct/FeaturedProduct.ascx" TagName="FeaturedProduct" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/BlockProducts/BlockProductsListItem.ascx" TagName="BlockProductsListItem" TagPrefix="Vivo" %>

<div class="block block-products block-products--layout--large-first">
    <div class="container">
        <div class="block-header">
            <h3 class="block-header__title">Najpopularniji proizvodi</h3>
            <div class="block-header__divider"></div>
        </div>
        <div class="block-products__body">

            <Vivo:FeaturedProduct ID="featuredProduct" runat="server"></Vivo:FeaturedProduct>

            <div class="block-products__list">
                <asp:Repeater ID="rptFeaturedProducts" runat="server">
                    <ItemTemplate>
                        <Vivo:BlockProductsListItem runat="server" Product="<%#Container.DataItem %>"></Vivo:BlockProductsListItem>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

        </div>
    </div>
</div>
