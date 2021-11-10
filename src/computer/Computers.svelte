<script>
    import Fa from 'svelte-fa'
    import { faInfoCircle, faTrash, faPlusCircle } from '@fortawesome/free-solid-svg-icons'
    import { Table, Button, Card, CardHeader, CardBody, Container } from "sveltestrap";
    import { Link, navigate } from "svelte-routing";

    import { onMount } from "svelte";
    import { httpGet, httpDelete } from "../common/api.js";

    let computers = [];
    onMount(async function () {
        const { data } = await httpGet("/computers");
        computers = data;
    });

    async function handleDelete(id) {
        const {ok} = await httpDelete("/computers/" + id);
        if (ok) {
            const { data } = await httpGet("/computers");
            computers = data;
        }
    };
</script>

<Card>
    <CardHeader>
        Computers list
        <Button size="sm" class="float-end" on:click={() => navigate("/computers/new")}>Add</Button>
    </CardHeader>
    <CardBody>
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
                        <td align="right">
                            <Link to="/computers/{computer.id}" title="Computer detail" class="btn btn-secondary btn-sm"><Fa icon={faInfoCircle} /></Link>
                            <Link to="/computers" title="Delete computer" class="btn btn-danger btn-sm" on:click={() => {handleDelete(computer.id)}}><Fa icon={faTrash} /></Link>
                        </td>
                    </tr>
                {/each}
            </tbody>
        </Table>

    </CardBody>
</Card>
