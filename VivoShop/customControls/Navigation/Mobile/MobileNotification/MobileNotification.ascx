<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MobileNotification.ascx.cs" Inherits="VivoShop.customControls.Navigation.Mobile.MobileNotification.MobileNotification" %>
<div class="notification" id='<%=ID %>'>
    <span class="notification__close" onclick="mobileNotification_click(this)">
        <%--<span class="fa fa-remove"></span>--%>
        <svg width="20px" height="20px">
            <use xlink:href="/images/sprite.svg#cross-10"></use>
        </svg>
    </span>
    <div class="notification__header">
        <div class="notification__header__icon">
            <svg width="20px" height="20px">
                <use xlink:href="/images/sprite.svg#check-12x9"></use>
            </svg>
        </div>
        <%--<asp:Label ID="lblIcon" runat="server"></asp:Label>--%>
        <asp:Label ID="lblHeader" runat="server"></asp:Label>
    </div>
    <div class="notification__body d-flex justify-content-center">
        <div class="notification__body__content">
            <asp:Literal ID="lblContent" runat="server"></asp:Literal>
        </div>
        <asp:HyperLink ID="lnkLeft" runat="server"></asp:HyperLink>
        <asp:HyperLink ID="lnkButton3" runat="server"></asp:HyperLink>
        <%--<asp:HyperLink ID="lnkRight" runat="server"></asp:HyperLink>--%>
        <button type="button" class="btn btn-secondary" onclick="mobileNotification_click(this)">Nastavi kupovinu</button>
    </div>
</div>