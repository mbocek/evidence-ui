<script>
    import { Router, Route, navigate } from "svelte-routing";
    import { Styles, Navbar, NavbarBrand, Nav, NavItem, NavLink, Container, Row, ListGroup, ListGroupItem } from "sveltestrap";
    import Computers from "./computer/Computers.svelte";

    export let url = "";
</script>

<Styles />

<Navbar class="navbar-dark bg-dark p-0">
    <NavbarBrand on:click={() => navigate("/")}>Evidence</NavbarBrand>
    <Nav navbar>XXX</Nav>
</Navbar>

<Container fluid>
    <Row>
        <Navbar class="col-md-2 d-md-block bg-light sidebar">
            <Nav>
                <NavItem>
                    <NavLink active on:click={() => navigate("/computers")}>Computers</NavLink>
                </NavItem>
                <NavItem>
                    <NavLink>Test</NavLink>
                </NavItem>
            </Nav>
        </Navbar>
        <main role="main" class="col-md-10">
            <Container>
                <Router {url}>
                    <Route path="/">Home page</Route>
                    <Route path="/computers" component="{Computers}" />
                </Router>
            </Container>
        </main>
    </Row>
</Container>
