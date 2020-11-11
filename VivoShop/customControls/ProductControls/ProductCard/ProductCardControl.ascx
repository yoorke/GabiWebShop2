<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductCardControl.ascx.cs" Inherits="VivoShop.customControls.ProductControls.ProductCardControl" %>
<%@ Register Src="~/customControls/ProductControls/ProductCard/ProductCardReview.ascx" TagName="ProductCardReview" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/ProductControls/ProductCard/ProductCardFeaturesList.ascx" TagName="ProductCardFeaturesList" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/ProductControls/ProductCard/ProductCardActions.ascx" TagName="ProductCardActions" TagPrefix="Vivo" %>

<div ID="divProductCard" runat="server" class="product-card">
    <button class="product-card__quickview" type="button">
        <svg width="16px" height="16px">
            <use xlink:href="/images/sprite.svg#quickview-16"></use>
        </svg>
        <span class="fake-svg-icon"></span>
    </button>

    <div class="product-card__badges-list">
        <div id="divBadge" runat="server" class="product-card__badge product-card__badge--new">
            <asp:Literal ID="lblBadgeTitle" runat="server"></asp:Literal>
        </div>
    </div>

    <div class="product-card__image">
        <asp:HyperLink ID="lnkProductImage" runat="server">
            <asp:Image ID="imgProduct" runat="server" />
        </asp:HyperLink>
    </div>

    <div class="product-card__info">
        <div class="product-card__name">
            <asp:HyperLink ID="lnkProductName" runat="server">
                <asp:Literal ID="lblProductName" runat="server"></asp:Literal>
            </asp:HyperLink>
        </div>

        <Vivo:ProductCardReview runat="server"></Vivo:ProductCardReview>

        <Vivo:ProductCardFeaturesList runat="server"></Vivo:ProductCardFeaturesList>
    </div>

    <Vivo:ProductCardActions ID="productActions" runat="server"></Vivo:ProductCardActions>

</div>
