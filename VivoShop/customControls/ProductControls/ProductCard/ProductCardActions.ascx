<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductCardActions.ascx.cs" Inherits="VivoShop.customControls.ProductControls.ProductCard.ProductCardActions" %>
<div class="product-card__actions">
    <div class="product-card__availability">
        <%--Availability: --%>
            <%--<span class="text-success">--%>
                <%--In Stock--%>
                <asp:Label ID="lblAvailability" runat="server"></asp:Label>
            <%--</span>--%>
    </div>
    <div class="product-card__prices" id="priceDiv" runat="server">
        <%--$749.00--%>
        <div id="regularPriceDiv" runat="server">
            <asp:Literal ID="lblProductPrice" runat="server"></asp:Literal><small> RSD</small>
        </div>
        <div id="promotionPriceDiv" runat="server" visible="false">
            <span class="product-card__new-price"><asp:Literal ID="lblPromotionPrice" runat="server"></asp:Literal><small> RSD</small></span>
            <span class="product-card__old-price"><asp:Literal ID="lblOldPrice" runat="server"></asp:Literal><small> RSD</small></span>
        </div>
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

        <button class="btn btn-light btn-svg-icon btn-svg-icon--fake-svg product-card__wishlist" type="button" id="btnWishList" runat="server">
            <svg width="16px" height="16px">
                <use xlink:href="/images/sprite.svg#wishlist-16"></use>
            </svg>
            <span class="fake-svg-icon fake-svg-icon--wishlist-16"></span>
        </button>

        <button class="btn btn-light btn-svg-icon btn-svg-icon--fake-svg product-card__compare" type="button" id="btnCompare" runat="server">
            <svg width="16px" height="16px">
                <use xlink:href="/images/sprite.svg#compare-16"></use>
            </svg>
            <span class="fake-svg-icon fake-svg-icon--compare-16"></span>
        </button>
    </div>
</div>
