<script>
    import { navigate } from "svelte-routing";
    import { Form, FormGroup, Input, Label, Button, Card, CardBody, CardHeader, Col, Row } from "sveltestrap";
    import { onMount } from "svelte";
    import { httpPut, httpGet } from "../common/api.js";
    import ErrorMessage from "../component/ErrorMessage.svelte";

    export let id;
    let computer = {};
    let addresses = [];
    let error;

    onMount(async function () {
        let result = await httpGet("/computers/" + id);
        if (result.ok) {
            computer = result.data;
        } else {
            error = result.data;
        }
        result = await httpGet("/addresses");
        if (result.ok) {
            addresses = result.data;
        } else {
            error = result.data;
        }
    });

    async function handleSubmit(event) {
        event.preventDefault();
        const { ok } = await httpPut("/computers/" + computer.id, computer);
        if (ok) {
            navigate("/computers");
        }
    }
</script>

<ErrorMessage error={error} />

<Card>
    <CardHeader>
        Computer details
    </CardHeader>
    <CardBody>
        <Form on:submit={handleSubmit}>
            <Input hidden id="id" bind:value={computer.id} />
            <FormGroup row>
                <Label for="name" sm="2">Name</Label>
                <Col sm="10">
                    <Input id="name" placeholder="Computer name" bind:value={computer.name} />
                </Col>
            </FormGroup>
            <FormGroup row>
                <Label for="domain" sm="2">Domain</Label>
                <Col sm="10">
                    <Input id="domain" placeholder="Computer domain" bind:value={computer.domain} />
                </Col>
            </FormGroup>
            <FormGroup row>
                <Label for="vendor" sm="2">Vendor</Label>
                <Col sm="10">
                    <Input id="vendor" placeholder="Computer vendor" bind:value={computer.vendor} />
                </Col>
            </FormGroup>
            <FormGroup row>
                <Label for="purchaseDate" sm="2">Purchase Date</Label>
                <Col sm="10">
                    <Input type="date" id="purchaseDate" placeholder="Computer purchase date" bind:value={computer.purchaseDate}/>
                </Col>
            </FormGroup>
            <FormGroup row>
                <Label for="locality" sm="2">Address</Label>
                <Col sm="10">
                    <Input type="select" id="locality" bind:value={computer.locality}>
                    {#each addresses as address}
                        <option value="{address}" selected={computer.locality.id === address.id}>{address.city} - {address.street}</option>
                    {/each}
                    </Input>
                </Col>
            </FormGroup>
            <Row>
                <Col sm="12">
                    <Button class="float-end">Save</Button>
                </Col>
            </Row>
        </Form>
    </CardBody>
</Card>
