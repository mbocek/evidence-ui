<script>
    import { Router, Route, navigate, Link } from "svelte-routing";
    import { Navbar, NavbarBrand, Nav, Container, Row } from "sveltestrap";
    import Computers from "./computer/Computers.svelte";
    import ComputerDetail from "./computer/ComputerDetail.svelte";
    import ComputerCreate from "./computer/ComputerCreate.svelte";
    import NavigationItem from "./component/NavigationItem.svelte";

    export let url = "";
</script>

<svelte:head>
    <link href="/fontawesome/css/all.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css">
</svelte:head>

<Navbar class="navbar-dark bg-dark p-0">
    <NavbarBrand on:click={() => navigate("/")}>Evidence</NavbarBrand>
    <Nav navbar>XXX</Nav>
</Navbar>

<Container fluid>
    <Row>
        <Navbar class="col-md-2 d-md-block bg-light sidebar" container=''>
            <Nav class="flex-column">
                <NavigationItem to="/computers" icon="desktop">Computers</NavigationItem>
            </Nav>
        </Navbar>
        <main role="main" class="col-md-10">
            <Container class="pt-3">
                <Router {url}>
                    <Route path="/">Home page</Route>
                    <Route path="/computers"><Computers/></Route>
                    <Route path="/computers/:id" let:params><ComputerDetail id="{params.id}"/></Route>
                    <Route path="/computers/new" let:params><ComputerCreate/></Route>
                </Router>
            </Container>
        </main>
    </Row>
</Container>
