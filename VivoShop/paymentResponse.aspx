<%@ Page Title="" Language="C#" MasterPageFile="~/VivoShop.Master" AutoEventWireup="true" CodeBehind="paymentResponse.aspx.cs" Inherits="VivoShop.paymentResponse" %>
<%@ Register Src="~/customControls/Header/Desktop/DesktopHeader.ascx" TagName="DesktopHeader" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/PageHeaderControls/PageHeader.ascx" TagName="PageHeader" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/PageNotification/PageNotification.ascx" TagName="PageNotification" TagPrefix="Vivo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <Vivo:DesktopHeader runat="server" IsHomepage="false" />
    
    <div class="site__body">
        <Vivo:PageHeader ID="pageHeader" runat="server" Title="Status plaćanja" />

        <div class="block">
            <div class="container">
                <%--<span>
                    PLACANJE USPESNO
                </span>--%>

                <div class="row">
                    <div class="col-md-8 offset-2">
                        <div class="" id="box" runat="server">
                            <div id="boxHeader" runat="server" class="border p-1 text-center text-white mb-5 mt-2">
                                <asp:Label ID="lblIconDanger" CssClass="fas fa-exclamation-triangle header-icon " runat="server" Visible="false"></asp:Label>
                                <asp:Label ID="lblIconSucess" CssClass="fas fa-check-circle header-icon" runat="server" Visible="false"></asp:Label>
                                <asp:Label ID="lblResponseHeader" runat="server" CssClass="d-block margin-top-1"></asp:Label>
                            </div>
                            <div class="row" id="divMessage" runat="server">
                                <div class="col-md-12">
                                    <div class="form-group row text-center bg-light border">
                                        <asp:Label ID="lblMessage" runat="server" CssClass="col-form-label col-md-12"></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="box-content">
                                <div class="row" id="divResponse" runat="server" visible="false">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <asp:Label ID="lblNameLabel" CssClass="col-form-label col-md-4" runat="server">Naziv:</asp:Label>
                                            <div class="col-md-8">
                                                <asp:Label ID="lblName" runat="server" CssClass="bold form-control"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group row small">
                                            <asp:Label ID="lblOrderIDLabel" CssClass="col-form-label col-md-4 padding-top-0 padding-bottom-0" runat="server">Broj narudžbine:</asp:Label>
                                            <div class="col-md-8">
                                                <asp:Label ID="lblOrderID" runat="server" CssClass="bold form-control padding-top-0 padding-bottom-0"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group row small">
                                            <asp:Label ID="lblAuthCodeLabel" CssClass="col-form-label col-md-4 padding-top-0 padding-bottom-0" runat="server">Autorizacioni kod:</asp:Label>
                                            <div class="col-md-8">
                                                <asp:Label ID="lblAuthCode" runat="server" CssClass="bold form-control padding-top-0 padding-bottom-0"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group row small">
                                            <asp:Label ID="lblTransactonDateLabel" runat="server" CssClass="col-form-label col-md-4 padding-top-0 padding-bottom-0">Datum transakcije:</asp:Label>
                                            <div class="col-md-8">
                                                <asp:Label ID="lblTransactionDate" runat="server" CssClass="bold form-control padding-top-0 padding-bottom-0"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group row small">
                                            <asp:Label ID="lblMdStatusLabel" runat="server" CssClass="col-form-label col-md-4 padding-top-0 padding-bottom-0">Statusni kod 3d transakcije:</asp:Label>
                                            <div class="col-md-8">
                                                <asp:Label ID="lblMdStatus" runat="server" CssClass="bold form-control padding-top-0 padding-bottom-0"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <asp:Label ID="lblUsernameLabel" runat="server" CssClass="col-form-label col-md-5">Email:</asp:Label>
                                            <div class="col-md-7">
                                                <asp:Label ID="lblUsername" runat="server" CssClass="bold form-control"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group row small">
                                            <asp:Label ID="lblTransactionIDLabel" CssClass="col-form-label col-md-5 padding-top-0 padding-bottom-0" runat="server">Broj transakcije:</asp:Label>
                                            <div class="col-md-7">
                                                <asp:Label ID="lblTransactionID" runat="server" CssClass="bold form-control padding-top-0 padding-bottom-0"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group row small">
                                            <asp:Label ID="lblLabel" CssClass="col-form-label col-md-5 padding-top-0 padding-bottom-0" runat="server">Status transakcije: </asp:Label>
                                            <div class="col-md-7">
                                                <asp:Label ID="lblResponse" runat="server" CssClass="bold form-control padding-top-0 padding-bottom-0"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group row small">
                                            <asp:Label ID="lblProcReturnCodeLabel" CssClass="col-form-label col-md-5 padding-top-0 padding-bottom-0" runat="server">Kod statusa transakcije:</asp:Label>
                                            <div class="col-md-7">
                                                <asp:Label ID="lblProcReturnCode" runat="server" CssClass="bold form-control padding-top-0 padding-bottom-0"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group row small">
                                            <asp:Label ID="lblErrorMessageLabel" CssClass="col-form-labell col-md-5 padding-top-0 padding-bottom-0" runat="server">Poruka:</asp:Label>
                                            <div class="col-md-7">
                                                <asp:Label ID="lblErrorMessage" runat="server" CssClass="bold form-control padding-top-0 padding-bottom-0"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContentPlaceholder" runat="server">
</asp:Content>
