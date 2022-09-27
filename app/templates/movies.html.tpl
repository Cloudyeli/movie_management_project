<p>This is my template rendered page</p>
#everything inside is concidered as python code; jinja2
<table>
    <tr>
        <th>Title</th>
        <th>Year</th>

    </tr>
# open forloop
{% for movies in movies_data %}
<tr>
    <td> {{movies[1]}}</td>
    <td> {{movies[2]}}</td>
</tr>
# close forloop
{% endfor %}
</table>
