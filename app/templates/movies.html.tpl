<p> This is my template rendered page </p>
<!--everything inside is concidered as python code; jinja2-->
<table>
    <tr>
        <th> Title </th>
        <th> Year </th>

    </tr>
<!--open forloop-->
{% for movie in movies_data %}
<tr>
<!--Title-->
    <td> {{ movie[1] }} </td>
<!--Year-->
    <td> {{ movie[2] }} </td>
</tr>
<!--close forloop-->
{% endfor %}
</table>
