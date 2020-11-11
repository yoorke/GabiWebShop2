<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BlockProductsColumns.ascx.cs" Inherits="VivoShop.customControls.BlockProductsColumns.BlockProductsColumns" %>
<%@ Register Src="~/customControls/BlockProductsColumns/BlockProductsColumnsColumn.ascx" TagName="BlockProductsColumnsColumn" TagPrefix="Vivo" %>

<div class="block block-product-columns d-lg-block d-none">
    <div class="container">
        <div class="row">
            <Vivo:BlockProductsColumnsColumn ID="column1" runat="server" />
            <Vivo:BlockProductsColumnsColumn ID="column2" runat="server" />
            <Vivo:BlockProductsColumnsColumn ID="column3" runat="server" />
            <%--<Vivo:BlockProductsColumnsColumn ID="column4" runat="server" />--%>
        </div>
    </div>
</div>
