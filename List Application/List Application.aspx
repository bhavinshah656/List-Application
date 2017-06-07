<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="List Application.aspx.cs" Inherits="List_Application.List_Application" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="My List" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Current Filter"></asp:Label>
&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                <asp:ListItem Value="false">Active</asp:ListItem>
                <asp:ListItem Value="true">Complete</asp:ListItem>
            </asp:DropDownList>
&nbsp;&nbsp;&nbsp;
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="listid" DataSourceID="SqlDataSource1" Width="492px">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="listid" HeaderText="listid" InsertVisible="False" ReadOnly="True" SortExpression="listid" />
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                    <asp:CheckBoxField DataField="isComplete" HeaderText="isComplete" SortExpression="isComplete" />
                    <asp:BoundField DataField="priority" HeaderText="priority" SortExpression="priority" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TaskDemoConnectionString %>" DeleteCommand="DELETE FROM [Task] WHERE [listid] = @listid" InsertCommand="INSERT INTO [Task] ([name], [isComplete], [priority]) VALUES (@name, @isComplete, @priority)" SelectCommand="SELECT * FROM [Task] WHERE ([isComplete] = @isComplete)" UpdateCommand="UPDATE [Task] SET [name] = @name, [isComplete] = @isComplete, [priority] = @priority WHERE [listid] = @listid">
                <DeleteParameters>
                    <asp:Parameter Name="listid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="isComplete" Type="Boolean" />
                    <asp:Parameter Name="priority" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="isComplete" PropertyName="SelectedValue" Type="Boolean" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="isComplete" Type="Boolean" />
                    <asp:Parameter Name="priority" Type="Int32" />
                    <asp:Parameter Name="listid" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Add Items :"></asp:Label>
&nbsp;
            <asp:TextBox ID="txtitem" runat="server"></asp:TextBox>
&nbsp;
            <asp:Button ID="btAdd" runat="server" OnClick="btAdd_Click" Text="Add" />
        </div>
    </form>
</body>
</html>
