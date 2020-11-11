<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Pagination.ascx.cs" Inherits="VivoShop.customControls.Pagination.Pagination" %>
<asp:Repeater ID="rptPagination" runat="server" OnItemDataBound="rptPagination_ItemDataBound">
    <HeaderTemplate>
        <ul class="pagination justify-content-center">
    </HeaderTemplate>
    <ItemTemplate>
        <li ID="pageLi" runat="server" class="page-item">
            <asp:HyperLink ID="lnkPage" runat="server" Text='<%#Eval("PageText") %>' CssClass="page-link"></asp:HyperLink>
        </li>
    </ItemTemplate>
    <FooterTemplate>
        </ul>
    </FooterTemplate>
</asp:Repeater>