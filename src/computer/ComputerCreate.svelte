<script>
    import { navigate } from "svelte-routing";
    import { Form, FormGroup, Input, Label, Button, Card, CardHeader, CardBody, Col, Row } from "sveltestrap";
    import { onMount } from "svelte";
    import { httpPost, httpGet } from "../common/api.js";

    let computer = {};
    let addresses = [];

    onMount(async function () {
        const {data} = await httpGet("/addresses");
        addresses = data;
    });

    async function handleSubmit(event) {
        event.preventDefault();
        const { ok } = await httpPost("/computers", computer);
        if (ok) {
            navigate("/computers");
        }
    }
</script>

<Card>
    <CardHeader>
        Computer details
    </CardHeader>
    <CardBody>
        <Form on:submit={handleSubmit}>
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
                        <option value="{address}">{address.city} - {address.street}</option>
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
