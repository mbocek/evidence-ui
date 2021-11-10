<script>
    import { navigate } from "svelte-routing";
    import { Form, FormGroup, Input, Label, Button, Card, CardBody, CardHeader, Col, Row } from "sveltestrap";
    import { onMount } from "svelte";
    import { httpPut, httpGet } from "../common/api.js";

    export let id;
    let computer = {};

    onMount(async function () {
        const { data } = await httpGet("/computers/" + id);
        computer = data;
    });

    async function handleSubmit(event) {
        event.preventDefault();
        let{ ok } = await httpPut("/computers/" + computer.id, computer);
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
            <Row>
                <Col sm="12">
                    <Button class="float-end">Save</Button>
                </Col>
            </Row>
        </Form>
    </CardBody>
</Card>
