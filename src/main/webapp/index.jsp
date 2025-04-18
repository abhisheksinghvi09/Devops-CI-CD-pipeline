<%@ page import="java.util.*,java.text.*" session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Get expense list from session or initialize if null
    List<Map<String, String>> expenses = (List<Map<String, String>>) session.getAttribute("expenses");
    if (expenses == null) {
        expenses = new ArrayList<>();
        session.setAttribute("expenses", expenses);
    }

    // Process form submission
    String item = request.getParameter("item");
    String amount = request.getParameter("amount");

    if (item != null && amount != null && !item.isEmpty() && !amount.isEmpty()) {
        Map<String, String> expense = new HashMap<>();
        expense.put("item", item);
        expense.put("amount", amount);
        expense.put("date", new SimpleDateFormat("dd-MM-yyyy").format(new Date()));
        expenses.add(expense);
    }
%>
<html>
<head>
    <title>Expense Tracker</title>
</head>
<body>
    <h2>Simple JSP Expense Tracker (Session Based)</h2>
    <form method="post">
        Item: <input type="text" name="item" required />
        Amount: <input type="number" name="amount" required />
        <input type="submit" value="Add Expense" />
    </form>

    <h3>Your Expenses:</h3>
    <table border="1">
        <tr><th>Item</th><th>Amount</th><th>Date</th></tr>
        <%
            for (Map<String, String> exp : expenses) {
        %>
            <tr>
                <td><%= exp.get("item") %></td>
                <td><%= exp.get("amount") %></td>
                <td><%= exp.get("date") %></td>
            </tr>
        <%
            }
        %>
    </table>
</body>
</html>
