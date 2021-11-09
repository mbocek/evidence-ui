<script>
    import { Table, Row, Col } from "sveltestrap";
    import { Link } from "svelte-routing";

    import { onMount } from "svelte";
    import { httpGet } from "../common/api.js";

    let computers = [];
    onMount(async function () {
        const { data } = await httpGet("/computers");
        computers = data;
    });
</script>

<Row>
    <Col><Link to="/computers/new"><i class="fa fa-plus float-end" /></Link></Col>
</Row>

<Table striped hover>
    <thead>
        <tr>
            <th>#</th>
            <th>Name</th>
            <th>Domain</th>
            <th colspan="2">Vendor</th>
        </tr>
    </thead>
    <tbody>
        {#each computers as computer}
            <tr>
                <th scope="row">{computer.id}</th>
                <td>{computer.name}</td>
                <td>{computer.domain}</td>
                <td>{computer.vendor}</td>
                <td><Link to="/computers/{computer.id}"><i class="fa fa-info"></i></Link><i class="fa fa-trash"></i></td>
            </tr>
        {/each}
    </tbody>
</Table>
