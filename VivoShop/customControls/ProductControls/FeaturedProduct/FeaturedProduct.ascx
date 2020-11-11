<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FeaturedProduct.ascx.cs" Inherits="VivoShop.customControls.ProductControls.FeaturedProduct.FeaturedProduct" %>
<%@ Register Src="~/customControls/ProductControls/ProductCard/ProductCardControl.ascx" TagName="ProductCard" TagPrefix="Vivo" %>

<div class="block-products__featured">
    <div class="block-products__featured-item">

        <Vivo:ProductCard ID="productCard" runat="server"></Vivo:ProductCard>

    </div>
</div>
