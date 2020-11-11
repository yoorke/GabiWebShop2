<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductCardActions.ascx.cs" Inherits="VivoShop.customControls.ProductControls.ProductCard.ProductCardActions" %>
<div class="product-card__actions">
    <div class="product-card__availability">
        Availability: 
            <span class="text-success">
                <%--In Stock--%>
                <asp:Literal ID="lnkAvailability" runat="server"></asp:Literal>
            </span>
    </div>
    <div class="product-card__prices">
        <%--$749.00--%>
        <asp:Literal ID="lblProductPrice" runat="server"></asp:Literal><small> din</small>
    </div>
    <div class="product-card__buttons">
        <button class="btn btn-primary product-card__addtocart" type="button" id="btnCart" runat="server">
            <%--Add To Cart--%>
            Dodaj u korpu
        </button>

        <button class="btn btn-secondary product-card__addtocart product-card__addtocart--list" type="button" id="btnCart2" runat="server">
            <%--Add To Cart--%>
            Dodaj u korpu
        </button>

        <button class="btn btn-light btn-svg-icon btn-svg-icon--fake-svg product-card__wishlist" type="button">
            <svg width="16px" height="16px">
                <use xlink:href="/images/sprite.svg#wishlist-16"></use>
            </svg>
            <span class="fake-svg-icon fake-svg-icon--wishlist-16"></span>
        </button>

        <button class="btn btn-light btn-svg-icon btn-svg-icon--fake-svg product-card__compare" type="button">
            <svg width="16px" height="16px">
                <use xlink:href="/images/sprite.svg#compare-16"></use>
            </svg>
            <span class="fake-svg-icon fake-svg-icon--compare-16"></span>
        </button>
    </div>
</div>
