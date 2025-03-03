<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductCardControlFPView.ascx.cs" Inherits="VivoShop.customControls.ProductControls.ProductCardControlFPView" %>
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

    <asp:HyperLink ID="lnkEditProduct" runat="server" CssClass="product-card__edit" Visible="false" Target="_blank">
        <span class="glyphicon glyphicon-pencil">Izmeni</span>
    </asp:HyperLink>

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

        <%--<Vivo:ProductCardReview runat="server"></Vivo:ProductCardReview>--%>

        <Vivo:ProductCardFeaturesList runat="server"></Vivo:ProductCardFeaturesList>
    </div>

    <Vivo:ProductCardActions ID="productActions" runat="server"></Vivo:ProductCardActions>
    <span id="lblCanBeDeliveredText" runat="server" class="product-card__bottom-info">
        <a href="/dostava" target="_blank">
            <span id="spanDelivery" runat="server" class="fa fa-truck" data-toggle="tooltip" data-placement="top" title="Artikal se šalje kurirskim službama"></span>
            <span id="spanInStore" runat="server" class="fa fa-home" data-toggle="tooltip" data-placement="top" title="Preuzimanje u radnji"></span>
            <span id="spanInCity" runat="server" class="fa fa-city" data-toggle="tooltip" data-placement="top" title="Dostava u Zrenjaninu"></span>
        </a>
    </span>
    <asp:HiddenField ID="lblProductID" runat="server" />
</div>
