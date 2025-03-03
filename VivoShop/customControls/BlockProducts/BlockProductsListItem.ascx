<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BlockProductsListItem.ascx.cs" Inherits="VivoShop.customControls.BlockProducts.BlockProductsListItem" %>
<%@ Register Src="~/customControls/ProductControls/ProductCard/ProductCardControlFPView.ascx" TagName="ProductCard" TagPrefix="Vivo" %>

<div class="block-products__list-item">
    <Vivo:ProductCard ID="productCard" runat="server"></Vivo:ProductCard>
</div>
